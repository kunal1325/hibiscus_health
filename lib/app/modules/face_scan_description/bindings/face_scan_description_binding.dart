import '../../../../import.dart';

class FaceScanDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceScanDescriptionController>(
          () => FaceScanDescriptionController(),
    );
  }
}
