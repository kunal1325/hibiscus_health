import '../../../../import.dart';

class StartMyJourneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartMyJourneyController>(
          () => StartMyJourneyController(),
    );
  }
}
