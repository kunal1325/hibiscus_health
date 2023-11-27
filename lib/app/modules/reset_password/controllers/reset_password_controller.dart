
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
  var errorMsg = Strings.emptyString.obs;

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
  void changeNewPasswordEyeIcon () {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }
  void changeConfirmNewPasswordEyeIcon () {
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

  void navigateToUpdatePassword(){
    Get.toNamed("/updatePassword");
  }

}
