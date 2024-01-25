import 'package:hibiscus_health/import.dart';

class InitialCheckinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialCheckinController>(() => InitialCheckinController());
  }
}
