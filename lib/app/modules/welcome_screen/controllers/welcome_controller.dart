
import '../../../../import.dart';

class WelcomeController extends GetxController {

  navigationAction(String path) {
    if (path == "/signUp") {
      Get.toNamed(Routes.signUp);
    } else {
      Get.toNamed(Routes.signIn);
    }
  }

}
