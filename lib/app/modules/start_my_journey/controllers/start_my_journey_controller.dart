import '../../../../import.dart';

class StartMyJourneyController extends GetxController {
  List<StartMyJourneyModel> startMyJourneyModel = [
    StartMyJourneyModel(Strings.connectedDietitian, Strings.emptyString),
    StartMyJourneyModel(
        Strings.firstFaceScan, Strings.firstFaceScanDescription),
    StartMyJourneyModel(
        Strings.firstAssessment, Strings.firstAssessmentDescription)
  ];

  var patientName = "".obs;
  var dietitianName = "".obs;

  void navigateToFaceScan() {
    // Get.offAllNamed("/landingpage");
    Get.offAndToNamed("/landingpage");
  }

  void getData() {
    patientName.value = Storage.getValue(Constants.patientName);
    dietitianName.value = Storage.getValue(Constants.dietitianName);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    super.onInit();
  }
}
