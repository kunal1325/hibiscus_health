import 'package:hibiscus_health/import.dart';

class MoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoreController>(() => MoreController());
  }
}
