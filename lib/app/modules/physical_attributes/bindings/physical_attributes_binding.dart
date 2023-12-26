import '../../../../import.dart';

class PhysicalAttributesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhysicalAttributesController>(
          () => PhysicalAttributesController(),
    );
  }
}
