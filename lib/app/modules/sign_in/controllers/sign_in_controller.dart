
import '../../../../import.dart';

class SignInController extends GetxController {

  final emailFocusNode = FocusNode();
  final pinFocusNode = FocusNode();

  final emailController = TextEditingController();
  final pinController = TextEditingController();

  bool isPinInVisible = true;
  var secretPinVisibility = Icons.visibility_off_outlined;

  GlobalKey globalKey = GlobalKey();

  changeVisibility () {
    isPinInVisible = !isPinInVisible;
    secretPinVisibility = secretPinVisibility ==
        Icons.visibility_off_outlined
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
  }


}
