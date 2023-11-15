
import '../../../../import.dart';

class WelcomeController extends GetxController {

  navigationAction(String path) {
    if (path == "/createAccount") {
      print("Create Account");
      Get.toNamed("/home");
    } else {
      Get.toNamed("/signIn");
    }
  }

}
