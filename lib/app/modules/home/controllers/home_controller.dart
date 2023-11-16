import '../../../../import.dart';

class HomeController extends GetxController {

  var counter = 0.obs;

  void incrementCounter() {
    Utils.showSnackBarFun(Get.context, Strings.alreadyTakenError);
      counter.value++;
      if (kDebugMode) {
        print("For Testing ");
      }
  }

}
