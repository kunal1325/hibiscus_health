import '../../../../import.dart';

class AnuraWebViewController extends GetxController {
  var controller = WebViewController().obs;
  var isLoading = false.obs;
  var WebViewUrl = "".obs;
  var email = "".obs;
  var hash = "".obs;
  var arguments = Get.arguments;
  var newController = WebViewController().obs;
  final ApiHelper _apiHelper = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    email.value = Storage.getValue(Constants.userEmail);
    isLoading.value = true;
    if(arguments != null || arguments != ""){
      WebViewUrl.value = arguments;
    }
    PlatformWebViewControllerCreationParams params =
        PlatformWebViewControllerCreationParams();
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams
          .fromPlatformWebViewControllerCreationParams(params);
    } 
    else {
      params = const PlatformWebViewControllerCreationParams();
    }
     newController.value =
        WebViewController.fromPlatformCreationParams(
      params,
      onPermissionRequest: (request) {
        request.grant();
      },
    );
    WebView();
    super.onInit();
  }
  void WebView() {
    newController.value
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) async {
            if (url.startsWith('https://awe.na-east.nuralogix.ai/c/')) {
              isLoading.value = false;
            }
          },
          onNavigationRequest: (NavigationRequest request) async {
            isLoading.value = true;
            if(kDebugMode){
              print("request.url ====================>>>>>>>>>>>>>>>\n ${request.url}");
            }
            if (request.url.startsWith(Constants.uRLForWebViewResultOne)) {
              if(request.url.startsWith(Constants.uRLForWebViewResultTwo)){
                var results = request.url;
                var baseWebViewUrlResult = Constants.uRLForWebViewResultTwo;
                final String result = results.replaceFirst(baseWebViewUrlResult, '');
                hash.value=result;
                await sentResultToEmail();
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            }else{
              if(request.url.startsWith(Constants.uRLForWebViewErrorInvalidBmi)){
                Utils.showSnackBarFun(Get.context, "INVALID_BMI");
              }
              Storage.saveValue(Constants.isFaceScanCompleted, false);
              Storage.saveValue(Constants.isScanFailed, true);
              Get.back(result: "triggerIt");
              isLoading.value = false;
              return NavigationDecision.navigate;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(WebViewUrl.value));
    controller.value = newController.value;
  }

  Future<void> sentResultToEmail() async {
    try {
      var isConnected =
      await Utils.checkInternetConnectivity();
      if (isConnected) {
        _apiHelper
            .sentEmail(
            SentEmailRequest(
                email: email.value,
                score: 73.4908,
                hash: hash.value
            ))
            .futureValue((value) async {
          var userResponse = UserModel.fromJson(value);
          if(userResponse.status == 200 && userResponse.msg == "Successfully Done Thanks!."){
            Storage.removeValue(Constants.isFaceScanCompleted);
            Storage.removeValue(Constants.isScanFailed);
            if(kDebugMode){
              print("200 ==============>>>>>>>>>>>> ");
            }
            Storage.saveValue(Constants.isFaceScanCompleted, true);
            await Get.offAll(() => StartMyJourneyView());
            isLoading.value = false;
          }else{
            Storage.saveValue(Constants.isFaceScanCompleted, false);
            Storage.saveValue(Constants.isScanFailed, true);
            Get.back(result: "triggerIt");
          }
        }, onError: (error) {
          print("sentResultToEmail Response Error $error");
          Storage.saveValue(Constants.isFaceScanCompleted, false);
          Storage.saveValue(Constants.isScanFailed, true);
          Get.back(result: "triggerIt");
        });
      } else {
        Utils.showSnackBarFun(Get.context, Strings.noConnection);
        Storage.saveValue(Constants.isFaceScanCompleted, false);
        Storage.saveValue(Constants.isScanFailed, true);
        Get.back(result: "triggerIt");
      }
    } catch (e) {
      print("===================>>>>>>>>>>>>>>> eeeeeeeeeeeeeeee");
      print(e);
      Storage.saveValue(Constants.isFaceScanCompleted, false);
      Storage.saveValue(Constants.isScanFailed, true);
      Get.back(result: "triggerIt");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newController.close();
    super.dispose();
  }
}
