import '../../../../import.dart';

class FaceScanController extends GetxController {
  var isScanFailed = false.obs;

  List<FaceScanModel> faceScanModel = [
    FaceScanModel(Strings.faceScanListOne),
    FaceScanModel(Strings.faceScanListTwo)
  ];

  changeScanStatus() async {
    getCameraPermission();

    isScanFailed.value = !isScanFailed.value;
    Get.toNamed(Routes.anuraWebViewScan);
  }

  getCameraPermission() async {
    final permission = Permission.camera;

    if (await permission.isDenied) {
      await permission.request();
    }
  }
}
