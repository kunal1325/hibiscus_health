import '../../../../import.dart';

class PersonalDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalDataController>(
          () => PersonalDataController(),
    );
  }
}
