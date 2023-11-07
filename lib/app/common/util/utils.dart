import '../../../import.dart';

abstract class Utils {

  static void closeSnackBar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

}
