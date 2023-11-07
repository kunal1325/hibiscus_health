import '../../../../import.dart';

class HomeController extends GetxController {

  var counter = 0.obs;

  void incrementCounter() {
      counter.value++;
      if (kDebugMode) {
        print("For Testing ");
      }
  }

  void decrementCounter() {
    counter.value != 0 ? counter.value-- : counter.value; //check the counter is not less then zero
  }

}
