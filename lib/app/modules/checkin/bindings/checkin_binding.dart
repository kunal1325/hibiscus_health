import 'package:hibiscus_health/import.dart';

class CheckinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckinController>(() => CheckinController());
  }
}
