
import '../../../../import.dart';

class SignInController extends GetxController {

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPinInVisible = true.obs;
  GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();
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
  void checkConnectivity() async {
    isLoading.value = true;
    Utils.dismissKeyboard();
    // loginUser();
    try {
      var temp = formKeySignIn.currentState;
      if (temp != null && temp.validate()) {
        var isConnected =
        await Utils.checkInternetConnectivity();
        if (isConnected) {
          errorMsg.value = Strings.emptyString;
          print("data =================>>>>>>>>>>>>>>>>>");
          print("email ====================>>>>>>>>>>>>>>>>> ${emailController.text}");
          print("password ====================>>>>>>>>>>>>>>>>> ${passwordController.text}");
          // loginUser();
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
    Get.off(SignUpView());
  }
  void navigateToForgotPassword(){
    print("Forgot Password");
    // Get.toNamed("/forgotPassword");
    Get.toNamed("/home");
  }
  navigateBack(){
    Get.offNamedUntil("/welcomeScreen", (route) => false);
  }









  final ApiHelper _apiHelper = Get.find();








  navigateHome(){
    Get.offNamedUntil("/home", (route) => false);
  }

  void loginUser() {
    Utils.dismissKeyboard();
    final isValid = formKeySignIn.currentState!.validate();
    if (!isValid) return;
    formKeySignIn.currentState!.save();

    _apiHelper
        .login(
        LoginRequest(email: emailController.text, password: passwordController.text))
        .futureValue((value) {
      print("Login Response =============>>>>>>>>>>>>>>>.");
      print("Login Response $value ");
      Storage.saveValue(Constants.TOKEN, value);
      navigateHome();
    }, onError: (error) {
      print("Login Response Error $error");
    });
  }



}
