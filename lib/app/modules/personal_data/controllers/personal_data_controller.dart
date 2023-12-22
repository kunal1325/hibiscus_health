
import '../../../../import.dart';

class PersonalDataController extends GetxController {

  final heightFtFocusNode = FocusNode();
  final heightInFocusNode = FocusNode();
  final weightFocusNode = FocusNode();
  final heightFtController = TextEditingController();
  final heightInController = TextEditingController();
  final weightController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? isValidHeightFt(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyHeightFtError;
    } else
      return null;
  }

  String? isValidHeightIn(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyHeightInError;
    } else
      return null;
  }

  String? isValidWeight(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyWeightError;
    } else
      return null;
  }

}
