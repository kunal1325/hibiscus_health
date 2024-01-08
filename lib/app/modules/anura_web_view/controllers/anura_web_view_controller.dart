import '../../../../import.dart';

class AnuraWebViewController extends GetxController {
  var controller = WebViewController().obs;
  var isLoading = false.obs;
  var WebViewUrl = "".obs;
  var email = "".obs;
  var hash = "".obs;
  var arguments = Get.arguments;
  var newController = WebViewController().obs;
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
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
          onNavigationRequest: (NavigationRequest request) {
            isLoading.value = true;
            if (request.url.startsWith('https://hibiscushealth.com/results?results=') ||
                request.url.startsWith('https://info.hibiscushealth.com/results?results=') ||
                request.url.startsWith('https://assessment.hibiscushealth.com/dashboard?results=')) {
              if(request.url.startsWith('https://assessment.hibiscushealth.com/dashboard?results=')){
                var results = request.url;
                var baseWebViewUrlResult = "https://assessment.hibiscushealth.com/dashboard?results=";
                final String result = results.replaceFirst(baseWebViewUrlResult, '');
                hash.value=result;
                sentEmail();
              }
              return NavigationDecision.navigate;
            }else{
              print("Error in Face Scan ====================>>>>>>>>>>>>>>>\n ${request.url}");
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
  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
  Future<void> sentEmail() async {
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
            .futureValue((value) {
          var userResponse = UserModel.fromJson(value);
          if(userResponse.status == 200 && userResponse.msg == "Successfully Done Thanks!."){
            Storage.saveValue(Constants.isFaceScanCompleted, true);
            Storage.removeValue(Constants.isScanFailed);
            Get.offAll(() => StartMyJourneyView());
            isLoading.value = false;
          }else{
            Utils.showSnackBarFun(Get.context, userResponse.msg ?? "Something Went Wrong !!!");
            Storage.saveValue(Constants.isFaceScanCompleted, false);
            Storage.saveValue(Constants.isScanFailed, true);
            Get.back(result: "triggerIt");
          }
        }, onError: (error) {
          print("Login Response Error $error");
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
