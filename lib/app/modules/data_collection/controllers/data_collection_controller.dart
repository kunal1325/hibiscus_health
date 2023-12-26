import '../../../../import.dart';

class DataCollectionController extends GetxController {

  var isLoading = false.obs;
  var processIndex = 0.obs;
  var isScanFailed = false.obs;

  GlobalKey<FormState> physicalAttributesFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> bioDataFormKey = GlobalKey<FormState>();

  DataCollectionModel dataCollectionModel= new DataCollectionModel();

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
    }else if (processIndex.value == 2) {
      isScanFailed.value = !isScanFailed.value;
      return false;
    } else {
      return true;
    }
  }

  String ButtonText() {
    if (processIndex.value == 0) {
      return Strings.next;
    }else if (processIndex.value == 1) {
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
    }else if (processIndex.value == 1) {
      saveBioDataToModel();
    } else {
      faceScanPage();
    }
  }

  void savePhysicalAttributesDataToModel(int height, int weight) {
    dataCollectionModel = new DataCollectionModel();
    dataCollectionModel.height = height;
    dataCollectionModel.weight = weight;
    // print("dataCollectionModel ================>>>> After ${dataCollectionModel.height} and ${dataCollectionModel.weight}");
    processIndex.value++;
  }

  void saveBioDataToModel() {
    // print("DataCollectionModel ===================>>>>>>> Before");
    // print(DataCollectionModel);
    // final isValid = physicalAttributesFormKey.currentState!.validate();
    // if (!isValid) return;
    // physicalAttributesFormKey.currentState!.save();
    // print("DataCollectionModel ===================>>>>>>> After");
    // print(DataCollectionModel);
    processIndex.value++;
  }

  void faceScanPage() {
    if (processIndex.value == 2) {
      isScanFailed.value = !isScanFailed.value;
    }
  }


}
