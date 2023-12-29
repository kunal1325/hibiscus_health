import '../../../../import.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/api_response_model/face_scan_requirement_model.dart';

class HomeController extends GetxController {

  var counter = 0.obs;

  var isDataLoading = false.obs;

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  FaceScanRequirementModel? faceScanRequirementModel;

  var configId = "".obs;
  var token = "".obs;
  var refreshToken = "".obs;
  var encryptProfileData = "".obs;

  void incrementCounter() {
    getConfigIdApi();
    counter.value++;
    if (kDebugMode) {
      print("For Testing ");
    }
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
        print(' getConfigIdApi =============>>>>');
        configId.value = faceScanRequirementModel?.configId ?? "";
      }else{
        Utils.showSnackBarFun(Get.context, Strings.somethingWentWrong);
      }
    }catch(e){
      print('Error while getting data is $e');
    }finally{
      getTokenApi();
    }
  }

  Future<void> getTokenApi() async {
    try{
      http.Request req = http.Request("Post", Uri.parse("http://assessment.hibiscushealth.com/api/token"))..followRedirects = false;
      http.Client baseClient = http.Client();
      http.StreamedResponse response1 = await baseClient.send(req);
      Uri redirectUri = Uri.parse(response1.headers['location']!);

      var response = await http.post(redirectUri,
          headers: {'Content-Type': "application/json; charset=utf-8"});

      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        faceScanRequirementModel =  FaceScanRequirementModel.fromJson(result);
        print(' getTokenApi =============>>>>');
        token.value = faceScanRequirementModel?.token ?? "";
        refreshToken.value = faceScanRequirementModel?.refreshToken ?? "";
      }else{
        print('response statusCode ${response.statusCode}');
      }
    }catch(e){
      print('Error while getting data is $e');
    }finally{
      getEncryptProfileApi();
    }
  }

  Future<void> getEncryptProfileApi() async {
    try{
      http.Request req = http.Request("Post", Uri.parse("http://assessment.hibiscushealth.com/api/encrypt-profile"))..followRedirects = false;
      http.Client baseClient = http.Client();
      http.StreamedResponse response1 = await baseClient.send(req);
      Uri redirectUri = Uri.parse(response1.headers['location']!);

      var response = await http.post(redirectUri,
          headers: {'Content-Type': "application/json; charset=utf-8"},
        body: json.encode(DataCollectionModel(
          identifier: "Kunal.hh@gmail.com",
          age: 26,
          height: 198,
          weight: 189,
          gender: "male",
          smoking: "1",
          bloodPressureMedication: "1",
          diabetes: false
        ))
      );

      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        faceScanRequirementModel =  FaceScanRequirementModel.fromJson(result);
        print(' getEncryptProfileApi =============>>>>');
        encryptProfileData.value = faceScanRequirementModel?.encryptedProfile ?? "";
      }else{
        print('response statusCode ${response.statusCode}');
      }
    }catch(e){
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
      faceScanRequirementModel = FaceScanRequirementModel(
        configId: configId.value,
        token: token.value,
        refreshToken: refreshToken.value,
        encryptedProfile: encryptProfileData.value
      );
      print(' FaceScanRequirementModel =============>>>>\n');
      print(faceScanRequirementModel?.toJson());
    }
  }



}
