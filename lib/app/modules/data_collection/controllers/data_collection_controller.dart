import '../../../../import.dart';
import 'package:http/http.dart' as http;

class DataCollectionController extends GetxController {
  final BioDataController bioDataController = Get.put(BioDataController());
  final FaceScanDescriptionController faceScanDescriptionController = Get.put(FaceScanDescriptionController());

  var isLoading = false.obs;
  var processIndex = 0.obs;

  GlobalKey<FormState> physicalAttributesFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> bioDataFormKey = GlobalKey<FormState>();

  DataCollectionModel dataCollectionModel = new DataCollectionModel();

  FaceScanRequirementModel? faceScanRequirementModel;

  var configId = "".obs;
  var token = "".obs;
  var refreshToken = "".obs;
  var encryptProfileData = "".obs;
  var faceScanWebUrl = "".obs;
  var hash = "eyJwcG0iOjkzLjY3MDcsImJtaSI6MzMuNTc2NSwic25yIjoyLjI5NjcsIm1zaSI6Mi43MzczLCJzeXN0b2xpYyI6MTM2LjAzNDgsImRpYXN0b2xpYyI6OTMuNjMxNSwiYWdlIjoyNCwiYnJlYXRoaW5nIjozMCwiaGVhbHRoU2NvcmUiOjYzLjQ3NjEsIndhaXN0VG9IZWlnaHQiOjYxLjI5MDMsImhlYXJ0UmF0ZVZhcmlhYmlsaXR5Ijo0MC43ODk5LCJjYXJkaWFjV29ya2xvYWQiOjQuMTA1MiwiYWJzaSI6Ny45MjI3LCJjdmRSaXNrIjowLjg4MzksInN0cm9rZVJpc2siOjAuOTksImhlYXJ0QXR0YWNrUmlzayI6MC4xMDU0LCJIeXBlcnRlbnNpb25SaXNrIjozMy4zMDk4LCJIeXBlcnRyaWdseWNlcmlkZW1pYVJpc2siOjE0Ljc5MzEsIkh5cGVyY2hvbGVzdGVyb2xlbWlhUmlzayI6ODAuODE2NywiRGlhYmV0ZXNSaXNrIjo4OS45Mzg0LCJpcnJlZ3VsYXJIZWFydEJlYXRzIjowLCJtZWFzdXJlbWVudElkIjoiMDM0OWZiYTctYzE2MC00NjVhLTg2MGItNzBkYjljM2RhOTI2IiwiYXZnU3RhclJhdGluZyI6NC42OTc1NjkyNDgxNjI4MTIsIk1FTlRBTF9TQ09SRSI6NCwiSFJWX1NETk4iOjQwLjc4OTksIkFCU0kiOjcuOTIyNywiQlBfQ1ZEIjowLjg4MzksIkZMRF9SSVNLX1BST0IiOjcyLjE0MTMsIk1TSSI6Mi43MzczLCJCUF9TWVNUT0xJQyI6MTM2LjAzNDgsIlZJVEFMX1NDT1JFIjozLjI1LCJCUF9SUFAiOjQuMTA1MiwiQk1JX0NBTEMiOjMzLjU3NjUsIkhFSUdIVCI6MTc3LjQyMTMsIkJQX0RJQVNUT0xJQyI6OTMuNjMxNSwiSEJBMUNfUklTS19QUk9CIjozNi4yMDA0LCJTTlIiOjIuMjk2NywiQlBfVEFVIjoxLjYyNiwiV0FJU1RfVE9fSEVJR0hUIjo2MS4yOTAzLCJEQlRfUklTS19QUk9CIjoxNC43OTMxLCJIUFRfUklTS19QUk9CIjozMy4zMDk4LCJIUl9CUE0iOjkzLjY3MDcsIldFSUdIVCI6ODcuMTY4MywiUklTS1NfU0NPUkUiOjMuMjg1NywiT1ZFUkFMTF9NRVRBQk9MSUNfUklTS19QUk9CIjo1OC4xOTk5LCJNRkJHX1JJU0tfUFJPQiI6NTMuNDU2MSwiQlBfU1RST0tFIjowLjk5LCJHRU5ERVIiOjEsIklIQl9DT1VOVCI6MCwiVEdfUklTS19QUk9CIjo4MC44MTY3LCJQSFlTSUNBTF9TQ09SRSI6Mi4zMzMzLCJCUl9CUE0iOjMwLCJCUF9IRUFSVF9BVFRBQ0siOjAuMTA1NCwiV0FJU1RfQ0lSQ1VNIjoxMTAuOTM1NSwiSERMVENfUklTS19QUk9CIjo4OS45Mzg0LCJBR0UiOjI0LCJIRUFMVEhfU0NPUkUiOjYzLjQ3NjEsIlBIWVNJT19TQ09SRSI6MywiTm90ZXMiOnsiQlBfQ1ZEIjpbIk5PVEVfTUlTU0lOR19NRURJQ0FMX0lORk8iLCJOT1RFX0RFR1JBREVEX0FDQ1VSQUNZIl0sIkJQX1NZU1RPTElDIjpbIk5PVEVfTUlTU0lOR19NRURJQ0FMX0lORk8iLCJOT1RFX0RFR1JBREVEX0FDQ1VSQUNZIl0sIlZJVEFMX1NDT1JFIjpbIk5PVEVfTUlTU0lOR19NRURJQ0FMX0lORk8iLCJOT1RFX0RFR1JBREVEX0FDQ1VSQUNZIl0sIkJQX1JQUCI6WyJOT1RFX01JU1NJTkdfTUVESUNBTF9JTkZPIiwiTk9URV9ERUdSQURFRF9BQ0NVUkFDWSJdLCJCUF9ESUFTVE9MSUMiOlsiTk9URV9NSVNTSU5HX01FRElDQUxfSU5GTyIsIk5PVEVfREVHUkFERURfQUNDVVJBQ1kiXSwiQlBfVEFVIjpbIk5PVEVfTUlTU0lOR19NRURJQ0FMX0lORk8iLCJOT1RFX0RFR1JBREVEX0FDQ1VSQUNZIl0sIlJJU0tTX1NDT1JFIjpbIk5PVEVfTUlTU0lOR19NRURJQ0FMX0lORk8iLCJOT1RFX0RFR1JBREVEX0FDQ1VSQUNZIl0sIkJQX1NUUk9LRSI6WyJOT1RFX01JU1NJTkdfTUVESUNBTF9JTkZPIiwiTk9URV9ERUdSQURFRF9BQ0NVUkFDWSJdLCJCUF9IRUFSVF9BVFRBQ0siOlsiTk9URV9NSVNTSU5HX01FRElDQUxfSU5GTyIsIk5PVEVfREVHUkFERURfQUNDVVJBQ1kiXSwiSEVBTFRIX1NDT1JFIjpbIk5PVEVfTUlTU0lOR19NRURJQ0FMX0lORk8iLCJOT1RFX0RFR1JBREVEX0FDQ1VSQUNZIl0sIlBIWVNJT19TQ09SRSI6WyJOT1RFX01JU1NJTkdfTUVESUNBTF9JTkZPIiwiTk9URV9ERUdSQURFRF9BQ0NVUkFDWSJdfSwic2Vzc2lvbklkIjoiVTJGc2RHVmtYMSUyRmtRZW5TbGhLWmRsOHFJUyUyRlV6Z3hQbE5xYnlCb2hJN3hURGlIVkJ0dmRDV1hJN1Bsc0ZnMjlUOVFMMFlmWkdpTHV5UmhIem1ocVZsS09TdEpFMTR6YzM0b3p2eHhaVFUxdHBkaVE3UWFyR25mdHJlQWYlMkZiSThtSG5yN2FsY3hlZXhiT3BQYXI5VzR5UzVZS2V0Vk5ZcE5uc2QxcE9ZdDNyc052TU85RTBpQzQxM2FTRlhDJTJCUHNQelpSbnZjRTlqdEF5dGhIWEhPUkdNanFHSndZa2pMVVJYckNkMGdNVUZCcDlkaEp2N0czc3pmNGtHZnFuUTlVdFUlMkZPTDJEUUNMSDdVTHJ1WHdWRFF4elg3NG1acGxPbGJrejBwaktKR2xtSFlrNmZZUTNySjlvZnU3OWk3djIzbUp4RERLd2IwbURabXVRTmVUVGNGJTJCVENDbFZjdzN4aTRhWXpsczd5NlFEdE51YlVRV285YlZNMFYySDFFZFJXQmNuQ2UzWnFjS3BudGpObVhyRkdiQ05RVkFqQWxabWYzOHVRY3JvaHlmbHpzMDIzTUNzUVAwVDFEcFlFdTM4OW1ET0JRWlNCZHlOYm1xNGJMV3lpU2EwY0NYRCUyRk0xbnZzS1hSeENvRjNuRWd1OWlEV0JDRUZIR2JPeFRZS0QzaERFVDNYdEZDVlJ0SXVEV1U4ek9WV2dyS3ZKeHpwWGp0MjZ4c2kzQ0pEZiUyRkpGZEczSExVdHlHZkZiZ1RQYVNja1dqTXlPMENCVHE0Y1pWblRCRlhXbjFrV2hndVBqaWwlMkJzOTVaQjdGd1YlMkJ3RFklMkJIZUg4U2ElMkJRNW5iRWswM2RGQ3BNZ1ZkVU92bEs3THNjYSUyRllFJTJCcSUyRmUyVHM2UUtRNTRRdXhQbExHZGxjS3RXJTJCTGlRMWJkUDI2RmF4TXZNaDB0RzdsJTJGb1dPZWxZVXA2VDJNeThJclg4QnhyNFRpV25ZUDFJcFcydlhKUlM4U1hTT2RaTWxWTmFidEtOcEFDQVVycHRkYSUyRlNjQlFGQVhkOEtIJTJGaUZQNmlLNU9XQjZLcWVTOFkzQlVPQWthMW13QUtiMSUyQkhNWkhnUmJqTnV5JTJCNzdxS0RDSjlodGhQNjVCckZxUXZjbUFHJTJGWCUyQkZNVCUyQmUlMkJZYWh0ZkdGR0x0UWVuVzhTcFIyUiUyRjBXeUpjSEp6RHhycmxkejQlMkY3enRaYjdvbEVhTUVnOFBCaHJqM0VHbSUyQmIxdnlQSklBJTJCREZBVEpEajh3N1YlMkJxWUVjc3B3eGI4QnBLZms3cmdKM0RmYzdjTm05Zmg0QzJyMllrQXQ3b0IlMkJDakxCZVd0SHozTGdrUTUwenAwcXBZbXZDa3FZNEFYTkdoWlRnTlNBaVJRUTJseDhQa0lFbjJoMk1rTmNFb2FEMkxnenZkOHNBRVZwNjRwOUwlMkZPb0FMMThKRHF3cmlEbDZ1WElrNXRkTXFRaFhBMWRUcGdMdFJMeFh6QXBCTmxZJTJCNUx6M21MYU5KcU5tTThoeU5wNkk3VVRoS2pwSElKWCUyRk1Lc08iLCJpZGVudGlmaWVyIjoiS3VuYWwuaGhAZ21haWwuY29tIiwiU0VTU0lPTl9JRCI6IlUyRnNkR1ZrWDElMkZrUWVuU2xoS1pkbDhxSVMlMkZVemd4UGxOcWJ5Qm9oSTd4VERpSFZCdHZkQ1dYSTdQbHNGZzI5VDlRTDBZZlpHaUx1eVJoSHptaHFWbEtPU3RKRTE0emMzNG96dnh4WlRVMXRwZGlRN1FhckduZnRyZUFmJTJGYkk4bUhucjdhbGN4ZWV4Yk9wUGFyOVc0eVM1WUtldFZOWXBObnNkMXBPWXQzcnNOdk1POUUwaUM0MTNhU0ZYQyUyQlBzUHpaUm52Y0U5anRBeXRoSFhIT1JHTWpxR0p3WWtqTFVSWHJDZDBnTVVGQnA5ZGhKdjdHM3N6ZjRrR2ZxblE5VXRVJTJGT0wyRFFDTEg3VUxydVh3VkRReHpYNzRtWnBsT2xia3owcGpLSkdsbUhZazZmWVEzcko5b2Z1NzlpN3YyM21KeERES3diMG1EWm11UU5lVFRjRiUyQlRDQ2xWY3czeGk0YVl6bHM3eTZRRHROdWJVUVdvOWJWTTBWMkgxRWRSV0JjbkNlM1pxY0twbnRqTm1YckZHYkNOUVZBakFsWm1mMzh1UWNyb2h5Zmx6czAyM01Dc1FQMFQxRHBZRXUzODltRE9CUVpTQmR5TmJtcTRiTFd5aVNhMGNDWEQlMkZNMW52c0tYUnhDb0YzbkVndTlpRFdCQ0VGSEdiT3hUWUtEM2hERVQzWHRGQ1ZSdEl1RFdVOHpPVldnckt2Snh6cFhqdDI2eHNpM0NKRGYlMkZKRmRHM0hMVXR5R2ZGYmdUUGFTY2tXak15TzBDQlRxNGNaVm5UQkZYV24xa1doZ3VQamlsJTJCczk1WkI3RndWJTJCd0RZJTJCSGVIOFNhJTJCUTVuYkVrMDNkRkNwTWdWZFVPdmxLN0xzY2ElMkZZRSUyQnElMkZlMlRzNlFLUTU0UXV4UGxMR2RsY0t0VyUyQkxpUTFiZFAyNkZheE12TWgwdEc3bCUyRm9XT2VsWVVwNlQyTXk4SXJYOEJ4cjRUaVduWVAxSXBXMnZYSlJTOFNYU09kWk1sVk5hYnRLTnBBQ0FVcnB0ZGElMkZTY0JRRkFYZDhLSCUyRmlGUDZpSzVPV0I2S3FlUzhZM0JVT0FrYTFtd0FLYjElMkJITVpIZ1Jiak51eSUyQjc3cUtEQ0o5aHRoUDY1QnJGcVF2Y21BRyUyRlglMkJGTVQlMkJlJTJCWWFodGZHRkdMdFFlblc4U3BSMlIlMkYwV3lKY0hKekR4cnJsZHo0JTJGN3p0WmI3b2xFYU1FZzhQQmhyajNFR20lMkJiMXZ5UEpJQSUyQkRGQVRKRGo4dzdWJTJCcVlFY3Nwd3hiOEJwS2ZrN3JnSjNEZmM3Y05tOWZoNEMycjJZa0F0N29CJTJCQ2pMQmVXdEh6M0xna1E1MHpwMHFwWW12Q2txWTRBWE5HaFpUZ05TQWlSUVEybHg4UGtJRW4yaDJNa05jRW9hRDJMZ3p2ZDhzQUVWcDY0cDlMJTJGT29BTDE4SkRxd3JpRGw2dVhJazV0ZE1xUWhYQTFkVHBnTHRSTHhYekFwQk5sWSUyQjVMejNtTGFOSnFObU04aHlOcDZJN1VUaEtqcEhJSlglMkZNS3NPIiwiTUVBU1VSRU1FTlRfSUQiOiIwMzQ5ZmJhNy1jMTYwLTQ2NWEtODYwYi03MGRiOWMzZGE5MjYifQ==".obs;

  Future<bool> onBackPressed() async {
    if (processIndex.value >= 1 && processIndex.value <= 3) {
      if(processIndex.value == 2){
        Storage.removeValue(Constants.isScanFailed);
        faceScanDescriptionController.getFaceScanStatus();
      }
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
      // isScanFailed.value = !isScanFailed.value;
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
      var temp = Storage.getValue(Constants.isScanFailed);
      if(temp != null && temp != "isScanFailed"){
        return Strings.tryAgain;
      }else{
        return Strings.startCamera;
      }
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
      requestPermission(Get.context);
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
      // Get.toNamed(Routes.anuraWebView,arguments: faceScanWebUrl.value);
      someTrigger();
    }
  }

  someTrigger() async{
    final gotoAnuraWebView = await Get.toNamed(Routes.anuraWebView,arguments: faceScanWebUrl.value);
    if(gotoAnuraWebView == "triggerIt"){
      faceScanDescriptionController.getFaceScanStatus();
      ButtonText();
    }
  }
}
