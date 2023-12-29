import '../../../../import.dart';

class DataCollectionController extends GetxController {
  final BioDataController bioDataController = Get.put(BioDataController());
  final StartMyJourneyController startMyJourneyController = Get.find();

  var isLoading = false.obs;
  var processIndex = 0.obs;
  var isScanFailed = false.obs;

  GlobalKey<FormState> physicalAttributesFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> bioDataFormKey = GlobalKey<FormState>();

  DataCollectionModel dataCollectionModel = new DataCollectionModel();

  Future<bool> onBackPressed() async {
    if (processIndex.value >= 1 && processIndex.value <= 3) {
      processIndex.value--;
      return false;
    } else {
      showExitPopup(Get.context);
      return true;
    }
  }

  Future<bool> onNextPressed() async {
    if (processIndex.value < 2) {
      processIndex.value++;
      return false;
    } else if (processIndex.value == 2) {
      showAlertDialog(
          Get.context!,
          "”Hibiscus Health” Would Like to Access to the Camera",
          "To take pictures and detect your face",
          false);
      isScanFailed.value = !isScanFailed.value;
      return false;
    } else {
      return true;
    }
  }

  String ButtonText() {
    if (processIndex.value == 0) {
      return Strings.next;
    } else if (processIndex.value == 1) {
      return Strings.proceedToFaceScan;
    } else {
      return Strings.startCamera;
    }
  }

  void onTapButton() {
    if (processIndex.value == 0) {
      final isValid = physicalAttributesFormKey.currentState!.validate();
      if (!isValid) return;
      physicalAttributesFormKey.currentState!.save();
    } else if (processIndex.value == 1) {
      saveBioDataToModel();
    } else {
      faceScanPage();
    }
  }

  void savePhysicalAttributesDataToModel(int height, int weight) {
    dataCollectionModel.height = height;
    dataCollectionModel.weight = weight;
    processIndex.value++;
  }

  void saveBioDataToModel() {
    if (bioDataController.gender == Strings.notSelected &&
        bioDataController.smoke == Strings.notSelected &&
        bioDataController.hypertension == Strings.notSelected &&
        bioDataController.bloodPressure == Strings.notSelected &&
        bioDataController.diabetic == Strings.notSelected) {
      Utils.showSnackBarFun(Get.context, Strings.compulsoryQuestionsError);
      return;
    }
    dataCollectionModel.gender = bioDataController.gender.value;
    dataCollectionModel.smoking =
        bioDataController.smoke.value == "yes" ? "1" : "0";
    dataCollectionModel.bloodPressureMedication =
        bioDataController.bloodPressure.value == "yes" ? "1" : "0";
    dataCollectionModel.diabetes =
        bioDataController.diabetic.value == "no" ? false : true;
    processIndex.value++;
  }

  void faceScanPage() {
    if (processIndex.value == 2 && isScanFailed.value == false) {
      isScanFailed.value = !isScanFailed.value;
    } else {
      requestPermission(Get.context);
      startMyJourneyController.isFaceScanCompleted.value = true;
      // Get.offAll(StartMyJourneyView());
    }
  }

  Future<void> requestPermission(context) async {
    final permission = Permission.camera;
    if (await permission.isGranted) {
      print("isGranted ================>");
    } else if (await permission.isDenied) {
      await permission.request();
    } else if (await permission.isPermanentlyDenied) {
      print("isPermanentlyDenied ================>");
      showAlertDialog(
          Get.context!,
          "Allow Hibiscus Health to access your camera ?",
          "You need to allow camera access in parameters for face scan in the app",
          true);
    }
  }

  showAlertDialog(
      BuildContext context, String title, String content, bool denied) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        requestPermission(Get.context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Allow Hibiscus Health to access your camera ?"),
      content: Text(
          "You need to allow camera access in parameters for face scan in the app"),
      actions: [
        okButton,
      ],
    );

    AlertDialog alert2 = AlertDialog(
      title: Text(title),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryColor,
      ),
      content: Text(content),
      contentTextStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.kPrimaryColor,
      ),
      actionsOverflowButtonSpacing: 5,
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Don’t Allow")),
        ElevatedButton(
            onPressed: () {
              denied
                  ? {Get.back(), openAppSettings()}
                  : {Get.back(), requestPermission(Get.context)};
            },
            child: Text(denied ? "Settings" : "OK")),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert2;
      },
    );
  }
}
