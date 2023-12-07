import 'package:hibiscus_health/import.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiHelper>(ApiHelperImpl());
    Get.lazyPut<LibraryController>(() => LibraryController());
  }
}
