
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
  // final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
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
  Future<void> checkConnectivity() async {
    Utils.dismissKeyboard();
    try {
      final isValid = formKeySignIn.currentState!.validate();
      if (!isValid) return;
      formKeySignIn.currentState!.save();
        var isConnected =
            await Utils.checkInternetConnectivity();
        if (isConnected) {
          errorMsg.value = Strings.emptyString;
          isLoading.value = true;
          _apiHelper
              .login(
              LoginRequest(email: emailController.text, password: passwordController.text))
              .futureValue((value) {
            var userResponse = UserModel.fromJson(value);

            if(userResponse.status == 200 && userResponse.msg == "Login Success"){
              Storage.saveValue(Constants.accessToken, userResponse.token?.access);
              Storage.saveValue(Constants.refreshToken, userResponse.token?.refresh);
              Storage.saveValue(Constants.userId, userResponse.userID);
              Storage.saveValue(Constants.dietitianId, userResponse.dietitianID);
              Storage.saveValue(Constants.patientName, userResponse.patientName);
              Storage.saveValue(Constants.dietitianName, userResponse.dietitianName);
              Storage.saveValue(Constants.userEmail, userResponse.email);
              Storage.saveValue(Constants.age, userResponse.age.toString());
              navigateHome();
              isLoading.value = false;
            }else{
              Utils.showSnackBarFun(Get.context, userResponse.msg ?? "Something Went Wrong !!!");
              isLoading.value = false;
            }
          }, onError: (error) {
            print("Login Response Error $error");
            isLoading.value = false;
          });

        } else {
          errorMsg.value = Strings.noConnection;
          Utils.showSnackBarFun(Get.context, Strings.noConnection);
          isLoading.value = false;
        }
    } catch (e) {
      print("===================>>>>>>>>>>>>>>> eeeeeeeeeeeeeeee");
      print(e);
      isLoading.value = false;
    }
  }

  void navigateToSignUp(){
    Get.offNamed(Routes.signUp);
  }
  void navigateToForgotPassword(){
    Get.toNamed(Routes.resetPassword);
  }
  navigateBack(){
    Get.offNamed(Routes.welcomeScreen);
  }
  navigateHome(){
    Get.toNamed(Routes.startMyJourney);
  }

}
