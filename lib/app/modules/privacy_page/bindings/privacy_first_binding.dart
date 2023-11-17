import '../../../../import.dart';

class PrivacyFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyFirstController>(
          () => PrivacyFirstController(),
    );
  }
}
