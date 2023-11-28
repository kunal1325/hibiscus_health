
import '../../../../import.dart';

class PrivacyFirstController extends GetxController {


  List<PrivacyFirstModel> privacyFirstModel = [
    PrivacyFirstModel(Strings.privacyFirstTitleOne),
    PrivacyFirstModel(Strings.privacyFirstTitleTwo),
    PrivacyFirstModel(Strings.privacyFirstTitleThree),
    PrivacyFirstModel(Strings.privacyFirstTitleFour),
  ];

  void navigateToCompleteForm(){
    Get.toNamed("/completeProfile");
  }

}
