import '../../../../import.dart';

class LandingScreen extends GetView<LandingScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingScreenController>(
        init: LandingScreenController(),
        builder: (controller) {
          return ConnectivityCheckWidget(
              body: SafeArea(
                  child: Scaffold(
                      body: PopScope(
                        canPop: false,
                        onPopInvoked: (didPop) {
                          if (controller.currentIndex.value == 0) {
                            showExitPopup(Get.context);
                          } else {
                            controller.pageController.jumpToPage(0);
                            Future.value((false));
                          }
                        },
                        child: SizedBox.expand(
                          child: PageView(
                            controller: controller.pageController,
                            onPageChanged: (index) {
                              controller.onSelectedIndexChanged(index);
                            },
                            children: <Widget>[
                              LibraryView(),
                              ProgressView(
                                  pageController: controller.pageController),
                              CheckinView(
                                  pageController: controller.pageController),
                              LearnView(
                                  pageController: controller.pageController),
                              MoreView(
                                  pageController: controller.pageController),
                            ],
                          ),
                        ),
                      ),
                      bottomNavigationBar:
                          Obx(() => Utils.bottomNavigationBar(controller)))));
        });
  }
}
