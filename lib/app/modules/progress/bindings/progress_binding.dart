import 'package:hibiscus_health/import.dart';

class ProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressController>(() => ProgressController());
  }
}
