
import '../../../../import.dart';

class HelpUsController extends GetxController {
  final fullNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final msgFocusNode = FocusNode();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final msgController = TextEditingController();

  GlobalKey<FormState> formKeyHelpUs = GlobalKey<FormState>();
  var isLoading = false.obs;

  var dropdownValues = [
    Strings.issue,
    "Sign In Issue",
    "Sign Up Issue",
    "Reset Password Issue",
    "Others"
  ].obs;

  var dropdownValue = Strings.issue.obs;
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  String? isValidFullName(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyFullNameError;
    }
    else
      return null;
  }
  String? isValidEmail(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyEmailError;
    } else if (!GetUtils.isEmail(text))
      return Strings.invalidEmailError;
    else
      return null;
  }
  String? isValidPhone(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyPhoneNumberError;
    }
    else
      return null;
  }
  void checkConnectivity() async {
    Utils.dismissKeyboard();
    try {
      final isValid = formKeyHelpUs.currentState!.validate();
      if (!isValid) return;
      if (dropdownValue.value == Strings.issue) {
        Utils.showSnackBarFun(Get.context, "Please select Issue you are facing from dropdown.");
        return;
      }
      formKeyHelpUs.currentState!.save();

      var isConnected =
      await Utils.checkInternetConnectivity();
      if (isConnected) {
        isLoading.value = true;

        _apiHelper
            .helpUs(
            HelpUsRequest(
              full_name: fullNameController.text,
              email: emailController.text,
              phone_number: phoneController.text,
              issue: dropdownValue.value,
              message: msgController.text,
            ))
            .futureValue((value) {
          var userResponse = UserModel.fromJson(value);
          if(userResponse.status == 200){
            navigateToRequestSubmitted();
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
        Utils.showSnackBarFun(Get.context, Strings.noConnection);
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
  void navigateToRequestSubmitted(){
    Get.offAndToNamed(Routes.requestSubmitted);
  }
  void navigateToWelcomeScreen(){
    Get.offAllNamed(Routes.welcomeScreen);
  }



}
