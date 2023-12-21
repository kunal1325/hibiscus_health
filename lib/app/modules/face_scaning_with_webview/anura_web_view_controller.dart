import 'package:webview_flutter/webview_flutter.dart';

import '../../../../import.dart';

class AnuraWebViewController extends GetxController {

  var controller = WebViewController().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    isLoading.value = true;
    controller.value = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            isLoading.value = false;
            if (url.toLowerCase().contains("https://vuejs.org/") && url.toLowerCase().contains("tutorial/")) {
              if (url.toLowerCase().contains("#step-2")) {
                Utils.showSnackBarFun(Get.context, "!!!!!!!!!!!!!! #step-2 !!!!!!!!!!!!!!!!!!!!!!");
              } else if (url.toLowerCase().contains("#step-3")) {
                Utils.showSnackBarFun(Get.context, "!!!!!!!!!!!!!! #step-3 !!!!!!!!!!!!!!!!!!!!!!");
              }
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://vuejs.org/tutorial/#step-1'));
    super.onInit();
  }


}
