
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
  var errorMsg = Strings.emptyString.obs;

  var dropdownValues = [
    Strings.issue,
    "Two",
    "Three",
    "Four",
    "Five"
  ].obs;

  var dropdownValue = Strings.issue.obs;

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
    isLoading.value = true;
    Utils.dismissKeyboard();
    try {
      var temp = formKeyHelpUs.currentState;
      if (temp != null && temp.validate()) {
        var isConnected =
        await Utils.checkInternetConnectivity();
        if (isConnected) {
          errorMsg.value = Strings.emptyString;
          print("data =================>>>>>>>>>>>>>>>>>");
          print("email ====================>>>>>>>>>>>>>>>>> ${emailController.text}");
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



}
