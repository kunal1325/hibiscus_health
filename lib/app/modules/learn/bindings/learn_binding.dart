import 'package:hibiscus_health/import.dart';

class LearnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnController>(() => LearnController());
  }
}
