import '../../../../import.dart';

class AnuraWebViewController extends GetxController {
  var controller = WebViewController().obs;
  var isLoading = false.obs;
  var WebViewUrl = "".obs;
  var arguments = Get.arguments;
  
  var newController = WebViewController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
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
          onPageFinished: (String url) {
            isLoading.value = false;
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://hibiscushealth.com/results?results=') ||
                request.url.startsWith('https://info.hibiscushealth.com/results?results=') ||
                request.url.startsWith('https://assessment.hibiscushealth.com/dashboard?results=')) {
              print("No Error in Face Scan ====================>>>>>>>>>>>>>>>\n");
              Storage.saveValue(Constants.isFaceScanCompleted, true);
              Get.offAll(() => StartMyJourneyView());
              return NavigationDecision.navigate;
            }else{
              print("Error in Face Scan ====================>>>>>>>>>>>>>>>\n ${request.url}");
              // Get.back();
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
}
