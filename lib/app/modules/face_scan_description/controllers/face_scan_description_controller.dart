import '../../../../import.dart';

class FaceScanDescriptionController extends GetxController {

  var isScanFailed = false.obs;

  List<FaceScanDescriptionModel> faceScanModel = [
    FaceScanDescriptionModel(Strings.faceScanListOne),
    FaceScanDescriptionModel(Strings.faceScanListTwo)
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    getFaceScanStatus();
    super.onInit();
  }

  getFaceScanStatus(){
    var temp = Storage.getValue(Constants.isScanFailed);
    if(temp != null && temp != "isFaceScanCompleted"){
      isScanFailed.value = temp;
    }else{
      isScanFailed.value = false;
    }
  }

}
