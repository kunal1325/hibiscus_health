import '../../../../import.dart';

class HomeController extends GetxController {

  var counter = 0.obs;

  void incrementCounter() {
      counter.value++;
      if (kDebugMode) {
        print("For Testing ");
      }
  }

}
