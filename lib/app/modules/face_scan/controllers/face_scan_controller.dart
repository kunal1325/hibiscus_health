
import '../../../../import.dart';

class FaceScanController extends GetxController {

  var isScanFailed = false.obs;

  List<FaceScanModel> faceScanModel = [
    FaceScanModel(Strings.faceScanListOne),
    FaceScanModel(Strings.faceScanListTwo)
  ];

  changeScanStatus() {
    isScanFailed.value = !isScanFailed.value;
  }


}
