import '../../../../import.dart';

class MoreController extends GetxController {

  void navigateToWelcomeScreen(){
    Storage.clearStorage();
    Get.offAllNamed(Routes.welcomeScreen);
  }

}
