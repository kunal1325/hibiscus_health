
import '../../../../import.dart';

class DataCollectionController extends GetxController {

  var isLoading = false.obs;
  var processIndex = 0.obs;
  var isScanFailed = false.obs;

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


}
