import '../../../../import.dart';

class DataCollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataCollectionController>(
          () => DataCollectionController(),
    );
  }
}
