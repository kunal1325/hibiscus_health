
import '../../../../import.dart';

class SignInController extends GetxController {

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPinInVisible = true.obs;

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


}
