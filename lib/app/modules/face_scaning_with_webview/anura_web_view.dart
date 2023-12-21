import 'package:webview_flutter/webview_flutter.dart';

import '../../../../import.dart';
import 'anura_web_view_controller.dart';

class AnuraWebView extends GetView<AnuraWebViewController> {
  const AnuraWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnuraWebViewController>(
      init: AnuraWebViewController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => showExitPopup(Get.context),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            resizeToAvoidBottomInset: false,
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: WebViewWidget(controller: controller.controller.value),
                ),
                Positioned(
                  top: 49,
                  left: 18,
                  child: GestureDetector(
                    onTap: () {
                      // controller.navigateBack();
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.kPrimaryColor,
                      size: 24,
                    ),
                  ),
                ),
                Obx(() =>
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: controller.isLoading.value,
                      child: Utils.getProgressBar(context),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
