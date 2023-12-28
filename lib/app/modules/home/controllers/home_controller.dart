import '../../../../import.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/api_response_model/face_scan_requirement_model.dart';

class HomeController extends GetxController {

  var counter = 0.obs;

  var isDataLoading = false.obs;

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  FaceScanRequirementModel? faceScanRequirementModel;

  void incrementCounter() {
    Utils.showSnackBarFun(Get.context, Strings.alreadyTakenError);
    getConfigIdApi().then((value) {
        counter.value++;
        if (kDebugMode) {
          print("For Testing ");
        }
    });
  }

  Future<void> getConfigIdApi() async {
    try{
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://assessment.hibiscushealth.com/api/configId')!,
      );
      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        faceScanRequirementModel =  FaceScanRequirementModel.fromJson(result);
        print(' FaceScanRequirementModel =============>>>>');
        print('${faceScanRequirementModel?.configId}');
      }else{
        Utils.showSnackBarFun(Get.context, Strings.somethingWentWrong);
      }
    }catch(e){
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
    }
  }

}
