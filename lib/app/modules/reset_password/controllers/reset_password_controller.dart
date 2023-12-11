import '../../../../import.dart';

class ResetPasswordController extends GetxController {
  // Reset Password Variables

  final emailFocusNode = FocusNode();
  final emailController = TextEditingController();
  GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();

  // Update Password Variables

  final otpFocusNode = FocusNode();
  final newPasswordFocusNode = FocusNode();
  final confirmNewPasswordFocusNode = FocusNode();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  var isNewPasswordVisible = true.obs;
  var isConfirmNewPasswordVisible = true.obs;

  GlobalKey<FormState> formKeyUpdatePassword = GlobalKey<FormState>();

  // Common Variables
  var isLoading = false.obs;
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  // Reset Password Functions
  String? isValidEmail(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyEmailError;
    } else if (!GetUtils.isEmail(text))
      return Strings.invalidEmailError;
    else
      return null;
  }

// Update Password Functions
  void changeNewPasswordEyeIcon() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void changeConfirmNewPasswordEyeIcon() {
    isConfirmNewPasswordVisible.value = !isConfirmNewPasswordVisible.value;
  }

  String? isValidOtp(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyOtpError;
    }
    if (text.length < 6) {
      return Strings.shortOtpError;
    }
    return null;
  }

  String? isValidNewPassword(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyNewPasswordError;
    }
    final hasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    final hasNumber = text.contains(RegExp(r'[0-9]'));
    if (!hasLetter || !hasNumber) {
      return Strings.invalidNewPasswordError;
    }
    if (text.length < 8) {
      return Strings.shortNewPasswordError;
    }
    return null;
  }

  String? isValidConfirmNewPassword(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyConfirmNewPasswordError;
    }
    final ConfirmHasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    final ConfirmHasNumber = text.contains(RegExp(r'[0-9]'));
    if (!ConfirmHasLetter || !ConfirmHasNumber) {
      return Strings.invalidConfirmPasswordError;
    }
    if (text != newPasswordController.text) {
      return Strings.passwordNotMatchedError;
    }
    if (text.length < 8) {
      return Strings.shortConfirmNewPasswordError;
    }
    return null;
  }

  // Navigation

  void navigateToUpdatePassword() {
    Get.toNamed("/updatePassword");
  }

  void navigateToProcessToLogin() {
    Get.offNamedUntil("/processToLogin", (route) => false);
  }

  void navigateToSignIn() {
    Get.offNamedUntil("/signIn", (route) => false);
  }

  void validateResetPasswordForm() async {
    try {
      final isValid = formKeyResetPassword.currentState!.validate();
      if (!isValid) return;
      formKeyResetPassword.currentState!.save();
      var isConnected = await Utils.checkInternetConnectivity();
      if (isConnected) {
        Utils.dismissKeyboard();
        isLoading.value = true;
        _apiHelper
            .requestOtp(RegisterRequest(
          email: emailController.text,
        ))
            .futureValue((value) {
          var userResponse = UserModel.fromJson(value);
          if (userResponse.status == 200) {
            navigateToUpdatePassword();
            isLoading.value = false;
          } else {
            Utils.showSnackBarFun(
                Get.context, userResponse.msg ?? "Something Went Wrong !!!");
            isLoading.value = false;
          }
        });
      } else {
        Utils.showSnackBarFun(Get.context, Strings.noConnection);
      }
    } catch (e) {
      print("Error =================>>>>>>>>>>>>>>>>>");
      print(e);
      isLoading.value = false;
    }
  }

  void checkConnectivity() async {
    try {
      final isValid = formKeyUpdatePassword.currentState!.validate();
      if (!isValid) return;
      formKeyUpdatePassword.currentState!.save();

      var isConnected = await Utils.checkInternetConnectivity();
      if (isConnected) {
        Utils.dismissKeyboard();
        isLoading.value = true;
        print("data =================>>>>>>>>>>>>>>>>>");
        print(
            "email ====================>>>>>>>>>>>>>>>>> ${emailController.text}");
        print(
            "otp ====================>>>>>>>>>>>>>>>>> ${otpController.text}");
        print(
            "password ====================>>>>>>>>>>>>>>>>> ${newPasswordController.text}");
        print(
            "confirm password ====================>>>>>>>>>>>>>>>>> ${confirmNewPasswordController.text}");

        _apiHelper
            .updatePassword(UpdatePasswordRequest(
          email: emailController.text,
          otp: otpController.text,
          new_password: confirmNewPasswordController.text,
        ))
            .futureValue((value) {
          var userResponse = UserModel.fromJson(value);
          if (userResponse.status == 200 &&
              userResponse.msg == "Password reset successfully.") {
            navigateToProcessToLogin();
            isLoading.value = false;
          } else {
            Utils.showSnackBarFun(
                Get.context, userResponse.msg ?? "Something Went Wrong !!!");
            isLoading.value = false;
          }
        });
      } else {
        Utils.showSnackBarFun(Get.context, Strings.noConnection);
        isLoading.value = false;
      }
    } catch (e) {
      print("Error =================>>>>>>>>>>>>>>>>>");
      print(e);
      Utils.showSnackBarFun(Get.context, "Something Went Wrong!");
      isLoading.value = false;
    }
  }
}
