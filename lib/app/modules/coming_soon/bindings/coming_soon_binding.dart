import 'package:hibiscus_health/import.dart';

class ComingSoonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComingSoonController>(() => ComingSoonController());
  }
}
