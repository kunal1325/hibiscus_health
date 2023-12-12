import '../../../../import.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingScreenController>(
          () => LandingScreenController(),
    );
  }
}
