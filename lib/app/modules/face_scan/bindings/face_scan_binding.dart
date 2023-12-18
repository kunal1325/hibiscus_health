import '../../../../import.dart';

class FaceScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceScanController>(
          () => FaceScanController(),
    );
  }
}
