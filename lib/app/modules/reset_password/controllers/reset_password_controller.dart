
import '../../../../import.dart';

class ResetPasswordController extends GetxController {

  final emailFocusNode = FocusNode();
  final emailController = TextEditingController();

  GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorMsg = Strings.emptyString.obs;

  String? isValidEmail(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyEmailError;
    } else if (!GetUtils.isEmail(text))
      return Strings.invalidEmailError;
    else
      return null;
  }

}
