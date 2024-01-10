import '../../../../import.dart';

class LandingScreen extends GetView<LandingScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingScreenController>(
        init: LandingScreenController(),
        builder: (controller) {
          return Scaffold(
              body: WillPopScope(
                onWillPop: () {
                  return Future.value(true);
                },
                child: SizedBox.expand(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.onSelectedIndexChanged(index);
                    },
                    children: <Widget>[
                      LibraryView(),
                      ProgressView(pageController: controller.pageController),
                      CheckinView(pageController: controller.pageController),
                      LearnView(pageController: controller.pageController),
                      MoreView(pageController: controller.pageController),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar:
                  Obx(() => Utils.bottomNavigationBar(controller)));
        });
  }
}
