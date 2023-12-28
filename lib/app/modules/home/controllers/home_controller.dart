import '../../../../import.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../data/models/api_response_model/face_scan_requirement_model.dart';

class HomeController extends GetxController {

  var counter = 0.obs;

  var isDataLoading = false.obs;

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  FaceScanRequirementModel? faceScanRequirementModel;

  void incrementCounter() {
    // Utils.showSnackBarFun(Get.context, Strings.alreadyTakenError);
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

      http.Request req = http.Request("Post", Uri.parse("http://assessment.hibiscushealth.com/api/token"))..followRedirects = false;
      http.Client baseClient = http.Client();
      http.StreamedResponse response1 = await baseClient.send(req);
      Uri redirectUri = Uri.parse(response1.headers['location']!);

      var response = await http.post(redirectUri,
          headers: {'Content-Type': "application/json; charset=utf-8"});

      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        faceScanRequirementModel =  FaceScanRequirementModel.fromJson(result);
        print(' FaceScanRequirementModel =============>>>>');
        print('${faceScanRequirementModel?.token}');
      }else{
        print('response statusCode ${response.statusCode}');
      }
    }catch(e){
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
    }
  }

}
