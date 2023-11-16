
import '../../../../import.dart';

class WelcomeController extends GetxController {

  navigationAction(String path) {
    if (path == "/signUp") {
      Get.toNamed("/signUp");
    } else {
      Get.toNamed("/signIn");
    }
  }

}
