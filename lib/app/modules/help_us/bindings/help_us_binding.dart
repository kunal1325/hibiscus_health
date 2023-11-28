import '../../../../import.dart';

class HelpUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpUsController>(
          () => HelpUsController(),
    );
  }
}
