
import '../../../../import.dart';

class SignUpController extends GetxController {

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isPasswordVisible = true.obs;
  var isConfirmPasswordVisible = true.obs;
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorMsg = Strings.emptyString.obs;
  void changePasswordEyeIcon () {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  void changeConfirmPasswordEyeIcon () {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
  String? isValidEmail(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyEmailError;
    } else if (!GetUtils.isEmail(text))
      return Strings.invalidEmailError;
    else
      return null;
  }
  String? isValidPassword(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyPasswordError;
    }
    final hasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    final hasNumber = text.contains(RegExp(r'[0-9]'));
    if (!hasLetter || !hasNumber) {
      return Strings.invalidPasswordError;
    }
    if (text.length < 8) {
      return Strings.shortPasswordError;
    }
    return null;
  }
  String? isValidConfirmPassword(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyConfirmPasswordError;
    }
    final ConfirmHasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    final ConfirmHasNumber = text.contains(RegExp(r'[0-9]'));
    if (!ConfirmHasLetter || !ConfirmHasNumber) {
      return Strings.invalidConfirmPasswordError;
    }
    if (text != passwordController.text) {
      return Strings.passwordNotMatchedError;
    }
    if (text.length < 8) {
      return Strings.shortConfirmPasswordError;
    }
    return null;
  }
  void checkConnectivity() async {
    isLoading.value = true;
    navigateToPrivacyFirst();
    return;
    Utils.dismissKeyboard();
    try {
      var temp = formKeySignUp.currentState;
      if (temp != null && temp.validate()) {
        var isConnected =
        await Utils.checkInternetConnectivity();
        if (isConnected) {
          errorMsg.value = Strings.emptyString;
          print("data =================>>>>>>>>>>>>>>>>>");
          print("email ====================>>>>>>>>>>>>>>>>> ${emailController.text}");
          print("password ====================>>>>>>>>>>>>>>>>> ${passwordController.text}");
          print("confirm password ====================>>>>>>>>>>>>>>>>> ${confirmPasswordController.text}");
          navigateToPrivacyFirst();
        } else {
          errorMsg.value = Strings.noConnection;
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
  void navigateToSignIn(){
    Get.off(SignInView());
  }
  void navigateToGetHelp(){
    Get.toNamed("/home");
  }

  void navigateToPrivacyFirst(){
    Get.toNamed("/privacyFirst");
  }
  void openTermsOfService(){

  }
  void openPrivacyPolicy(){

  }
  navigateBack(){
    Get.offNamedUntil("/welcomeScreen", (route) => false);
  }


}
