import '../../../../import.dart';

class AnuraWebView extends GetView<AnuraWebViewController> {
  
  const AnuraWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnuraWebViewController>(
      init: AnuraWebViewController(),
      builder: (controller) => ConnectivityCheckWidget(
          body: PopScope(
            canPop:false,
            onPopInvoked: (didPop) {
              showExitPopup(Get.context);
              return;
            },
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
                          Storage.saveValue(Constants.isScanFailed, true);
                          Get.back(result: "triggerIt");
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
      )
    );
  }
}

