
import '../../../../import.dart';

class SignInController extends GetxController {

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPinInVisible = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorMsg = Strings.emptyString.obs;
  void changeVisibility () {
    isPinInVisible.value = !isPinInVisible.value;
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
      return 'Please enter your password';
    }
    final hasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    final hasNumber = text.contains(RegExp(r'[0-9]'));
    if (!hasLetter || !hasNumber) {
      return 'Password must contain both letters and numbers';
    }
    if (text.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
  void checkConnectivity() async {
    isLoading.value = true;
    Utils.dismissKeyboard();
    try {
      var temp = formKey.currentState;
      if (temp != null && temp.validate()) {
        var isConnected =
        await Utils.checkInternetConnectivity();
        if (isConnected) {
          errorMsg.value = Strings.emptyString;
          print("data =================>>>>>>>>>>>>>>>>>");
          print("email ====================>>>>>>>>>>>>>>>>> ${emailController.text}");
          print("password ====================>>>>>>>>>>>>>>>>> ${passwordController.text}");
        } else {
          errorMsg.value = Strings.noConnection;
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  void navigateToSignUp(){
    print("Create Account");
    // Get.toNamed("/createAccount");
    Get.toNamed("/home");
  }

  void navigateToForgotPassword(){
    print("Forgot Password");
    // Get.toNamed("/forgotPassword");
    Get.toNamed("/home");
  }


}
