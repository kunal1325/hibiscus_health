import '../../../../import.dart';

class BioDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BioDataController>(
          () => BioDataController(),
    );
  }
}
