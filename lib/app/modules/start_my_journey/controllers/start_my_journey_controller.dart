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
  var isFaceScanCompleted = false.obs;

  void navigateToFaceScan() {
    Get.offAll(() => DataCollectionView());
  }

  void navigateToLanding() {
    Get.offAll(() => LandingScreen());
  }

  void navigateToDailyCheckIn() {
    Get.offAll(() => DailyCheckinView());
  }

  void getData() {
    Storage.removeValue(Constants.isScanFailed);
    patientName.value = Storage.getValue(Constants.patientName);
    dietitianName.value = Storage.getValue(Constants.dietitianName);
    var temp = Storage.getValue(Constants.isFaceScanCompleted);
    print("isFaceScanCompleted temp ================>>>>>>>>>>>>>>> $temp");
    if(temp != null && temp != "isFaceScanCompleted"){
      isFaceScanCompleted.value = temp;
    }
    // Storage.removeValue(Constants.isScanFailed);
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
