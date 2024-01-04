import '../../../../import.dart';
import 'package:http/http.dart' as http;

class DataCollectionController extends GetxController {
  final BioDataController bioDataController = Get.put(BioDataController());

  var isLoading = false.obs;
  var processIndex = 0.obs;
  var isScanFailed = false.obs;

  GlobalKey<FormState> physicalAttributesFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> bioDataFormKey = GlobalKey<FormState>();

  DataCollectionModel dataCollectionModel = new DataCollectionModel();

  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  FaceScanRequirementModel? faceScanRequirementModel;

  var configId = "".obs;
  var token = "".obs;
  var refreshToken = "".obs;
  var encryptProfileData = "".obs;
  var faceScanWebUrl = "".obs;

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
    } else if (processIndex.value == 2) {
      requestPermission(Get.context);
      isScanFailed.value = !isScanFailed.value;
      return false;
    } else {
      return true;
    }
  }

  String ButtonText() {
    if (processIndex.value == 0) {
      return Strings.next;
    } else if (processIndex.value == 1) {
      return Strings.proceedToFaceScan;
    } else {
      return Strings.startCamera;
    }
  }

  void onTapButton() {
    if (processIndex.value == 0) {
      final isValid = physicalAttributesFormKey.currentState!.validate();
      if (!isValid) return;
      physicalAttributesFormKey.currentState!.save();
    } else if (processIndex.value == 1) {
      saveBioDataToModel();
    } else {
      faceScanPage();
    }
  }

  void savePhysicalAttributesDataToModel(int height, int weight) {
    dataCollectionModel.height = height;
    dataCollectionModel.weight = weight;
    processIndex.value++;
  }

  void saveBioDataToModel() {
    if (bioDataController.gender == Strings.notSelected ||
        bioDataController.smoke == Strings.notSelected ||
        bioDataController.hypertension == Strings.notSelected ||
        bioDataController.bloodPressure == Strings.notSelected ||
        bioDataController.diabetic == Strings.notSelected) {
      Utils.showSnackBarFun(Get.context, Strings.compulsoryQuestionsError);
      return;
    }
    dataCollectionModel.gender = bioDataController.gender.value;
    dataCollectionModel.smoking =
        bioDataController.smoke.value == "yes" ? "1" : "0";
    dataCollectionModel.bloodPressureMedication =
        bioDataController.bloodPressure.value == "yes" ? "1" : "0";
    dataCollectionModel.diabetes =
        bioDataController.diabetic.value == "no" ? false : true;
    processIndex.value++;
  }

  void faceScanPage() {
    dataCollectionModel.identifier = Storage.getValue(Constants.userEmail);
    dataCollectionModel.age = int.parse(Storage.getValue(Constants.age));
    if (processIndex.value == 2 && isScanFailed.value == false) {
      isScanFailed.value = !isScanFailed.value;
    } else {
      requestPermission(Get.context);
    }
  }

  Future<void> requestPermission(context) async {
    final permission = Permission.camera;
    if (await permission.isGranted) {
      print("isGranted ================>");
      getConfigIdApi();
    } else if (await permission.isDenied) {
      showPermissionDialog(
          Get.context!,
          "”Hibiscus Health” Would Like to Access to the Camera",
          "To take pictures and detect your face",
          false);
    } else if (await permission.isPermanentlyDenied) {
      showPermissionDialog(
          Get.context!,
          "Allow Hibiscus Health to access your camera ?",
          "You need to allow camera access in parameters for face scan in the app",
          true);
    } else if (await permission.isLimited) {
      print("isLimited ================>");
    } else if (await permission.isProvisional) {
      print("isLimited ================>");
    } else if (await permission.isRestricted) {
      print("isLimited ================>");
    } else {
      print("permission ================> $permission");
    }
  }

  Future<void> requestPermissionAfterDeny(context) async {
    final permission = Permission.camera;
    await permission.request();
    if (await permission.isGranted) {
      print("isGranted ================>");
      getConfigIdApi();
    }
  }

  showPermissionDialog(
      BuildContext context, String title, String content, bool denied) {
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryColor,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      contentTextStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.kPrimaryColor,
      ),
      actionsOverflowButtonSpacing: 5,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                  Utils.showSnackBarFun(Get.context,
                      "Without Camera Permission, We are not able to get you face scan completed. So for go further, Please provide camera access permission.");
                },
                child: Text("Don’t Allow")),
            ElevatedButton(
                onPressed: () async {
                  denied
                      ? {Get.back(), openAppSettings()}
                      : {Get.back(), requestPermissionAfterDeny(context)};
                },
                child: Text(denied ? " Settings " : "   Allow   ")),
          ],
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> getConfigIdApi() async {
    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.tryParse('http://assessment.hibiscushealth.com/api/configId')!,
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        faceScanRequirementModel = FaceScanRequirementModel.fromJson(result);
        print(' getConfigIdApi =============>>>>');
        configId.value = faceScanRequirementModel?.configId ?? "";
      } else {
        Utils.showSnackBarFun(Get.context, Strings.somethingWentWrong);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      getTokenApi();
    }
  }

  Future<void> getTokenApi() async {
    try {
      http.Request req = http.Request(
          "Post", Uri.parse("http://assessment.hibiscushealth.com/api/token"))
        ..followRedirects = false;
      http.Client baseClient = http.Client();
      http.StreamedResponse response1 = await baseClient.send(req);
      Uri redirectUri = Uri.parse(response1.headers['location']!);

      var response = await http.post(redirectUri,
          headers: {'Content-Type': "application/json; charset=utf-8"});

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        faceScanRequirementModel = FaceScanRequirementModel.fromJson(result);
        print(' getTokenApi =============>>>>');
        token.value = faceScanRequirementModel?.token ?? "";
        refreshToken.value = faceScanRequirementModel?.refreshToken ?? "";
      } else {
        print('response statusCode ${response.statusCode}');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      getEncryptProfileApi();
    }
  }

  Future<void> getEncryptProfileApi() async {
    try{
      http.Request req = http.Request("Post", Uri.parse("http://assessment.hibiscushealth.com/api/encrypt-profile"))..followRedirects = false;
      http.Client baseClient = http.Client();
      http.StreamedResponse response1 = await baseClient.send(req);
      Uri redirectUri = Uri.parse(response1.headers['location']!);

      var requestBody = jsonEncode(DataCollectionModel(
          identifier: dataCollectionModel.identifier,
          age: dataCollectionModel.age,
          height: dataCollectionModel.height,
          weight: dataCollectionModel.weight,
          gender: dataCollectionModel.gender,
          smoking: dataCollectionModel.smoking,
          bloodPressureMedication: dataCollectionModel.bloodPressureMedication,
          diabetes: dataCollectionModel.diabetes
      ));

      var response = await http.post(redirectUri,
          headers: {'Content-Type': "application/json; charset=utf-8"},
          body: requestBody
      );
      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        faceScanRequirementModel =  FaceScanRequirementModel.fromJson(result);
        encryptProfileData.value = faceScanRequirementModel?.encryptedProfile ?? "";
      }else{
        print('response statusCode ${response.statusCode}');
      }
    }catch(e){
      print('Error while getting data is $e');
    }finally{
      faceScanRequirementModel = FaceScanRequirementModel(
          configId: configId.value,
          token: token.value,
          refreshToken: Uri.encodeComponent(refreshToken.value),
          encryptedProfile: Uri.encodeComponent(encryptProfileData.value)
      );
      isLoading(false);
      faceScanWebUrl.value = "https://awe.na-east.nuralogix.ai/c/${faceScanRequirementModel?.configId}/${faceScanRequirementModel?.encryptedProfile}/${faceScanRequirementModel?.token}/${faceScanRequirementModel?.refreshToken}";
      // Get.offAll(() => AnuraWebView(), arguments: faceScanWebUrl.value);
      Get.toNamed(Routes.anuraWebView,arguments: faceScanWebUrl.value);
    }
  }

}
