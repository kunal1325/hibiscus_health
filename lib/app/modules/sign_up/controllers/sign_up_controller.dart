
import '../../../../import.dart';

class SignUpController extends GetxController {

  ///Common variables
  var isLoading = false.obs;
  var errorMsg = Strings.emptyString.obs;

  ///Sign Up variables
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isPasswordVisible = true.obs;
  var isConfirmPasswordVisible = true.obs;
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();

  ///Complete Profile variables
  GlobalKey<FormState> formKeyCompleteProfile = GlobalKey<FormState>();
  final fNameFocusNode = FocusNode();
  final lNameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final dobFocusNode = FocusNode();
  final nutritionistFocusNode = FocusNode();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final nutritionistController = TextEditingController();

  DateTime? selectedDate;


  ///Sign Up variables
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



  ///Complete Profile variables
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

  String? isValidFName(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyFirstNameError;
    }
    else
      return null;
  }

  String? isValidLName(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyLastNameError;
    }
    else
      return null;
  }

  String? isValidPhone(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyPhoneNameError;
    }
    else
      return null;
  }

  String? isValidDob(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyDobNameError;
    }
    else
      return null;
  }

  String? isValidNutritionistCode(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyNutritionistCodeNameError;
    }
    else
      return null;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        dobController.text = '${picked.month} / ${picked.day} / ${picked.year}';
    }
  }


  ///Navigation from Sign Up
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
  navigateBackFromSignUp(){
    Get.offNamedUntil("/welcomeScreen", (route) => false);
  }

  navigateBackFromCompleteProfile(){
    Get.offNamedUntil("/signUp", (route) => false);
  }


}
