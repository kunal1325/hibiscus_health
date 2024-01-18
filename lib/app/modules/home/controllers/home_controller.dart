import '../../../../import.dart';

class HomeController extends GetxController {

  var counter = 0.obs;
  var isDataLoading = false.obs;
  void incrementCounter() {
    counter.value++;
    if (kDebugMode) {
      print("For Testing ");
    }
  }




}
