
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

  final ApiHelper _apiHelper = Get.find();


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

  navigateHome(){
    Get.offNamedUntil("/home", (route) => false);
  }

  Future<void> checkConnectivity() async {
    Utils.dismissKeyboard();
    isLoading.value = true;
    try {
      final isValid = formKeySignIn.currentState!.validate();
      if (!isValid) return;
      formKeySignIn.currentState!.save();
        var isConnected =
            await Utils.checkInternetConnectivity();
        if (isConnected) {
          errorMsg.value = Strings.emptyString;
          print("data =================>>>>>>>>>>>>>>>>>");
          // print("email ====================>>>>>>>>>>>>>>>>> ${emailController.text}");
          // print("password ====================>>>>>>>>>>>>>>>>> ${passwordController.text}");

          _apiHelper
              .login(
              // LoginRequest(email: emailController.text, password: passwordController.text))
              LoginRequest(email: "k@gmail.com", password: "kunal123"))
              .futureValue((value) {
            print("Login Response =============>>>>>>>>>>>>>>>.");
            print("Login Response $value ");
            Storage.saveValue(Constants.TOKEN, value);
            print("TOKEN =============>>>>>>>>>>>>>>>.");
            print("Constants.TOKEN ${Constants.TOKEN} ");
            print("value ${value} ");
            // navigateHome();
          }, onError: (error) {
            print("Login Response Error $error");
          });

        } else {
          errorMsg.value = Strings.noConnection;
        }
    } catch (e) {
      print("===================>>>>>>>>>>>>>>> eeeeeeeeeeeeeeee");
      print(e);
    }
    isLoading.value = false;
  }



}
