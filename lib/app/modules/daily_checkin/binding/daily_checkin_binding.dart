import 'package:hibiscus_health/import.dart';

class DailyCheckinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyCheckinController>(() => DailyCheckinController());
  }
}
