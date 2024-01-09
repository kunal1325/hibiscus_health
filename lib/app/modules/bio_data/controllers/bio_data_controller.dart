
import '../../../../import.dart';

class BioDataController extends GetxController {

  var gender = Strings.notSelected.obs;
  var smoke = Strings.notSelected.obs;
  var hypertension = Strings.notSelected.obs;
  var bloodPressure = Strings.notSelected.obs;
  var diabetic = Strings.notSelected.obs;

  changeGenderStatus(String genderValue) {
    gender.value = genderValue;
  }

  changeSmokeStatus(String smokeValue) {
    smoke.value = smokeValue;
  }

  changeHypertensionStatus(String hypertensionValue) {
    hypertension.value = hypertensionValue;
  }

  changeBloodPressureStatus(String bloodPressureValue) {
    bloodPressure.value = bloodPressureValue;
  }

  changeDiabeticStatus(String diabeticValue) {
    diabetic.value = diabeticValue;
  }



}
