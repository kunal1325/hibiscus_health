import '../../../../import.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.backwardAction(),
        child: Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            color: AppColors.black,
            child: Stack(
              children: [
                PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.selectedPageIndex,
                    itemCount: controller.onboardingPages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        controller.onboardingPages[index].imageAsset,
                        height: Get.height,
                        width: Get.width,
                        fit: BoxFit.fill,
                      );
                    }),
                Positioned(
                    right: 10,
                    top: 35,
                    child: InkWell(
                      onTap: controller.skipAction,
                      child: SizedBox(
                        width: 72,
                        height: 52,
                        child: Center(
                          child: Text(Strings.skip,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.previous,
                                shadows: [
                                  const Shadow(
                                    color: AppColors.black,      // Choose the color of the shadow
                                    blurRadius: 4.0,          // Adjust the blur radius for the shadow effect
                                    offset: Offset(0.0, 2.0), // Set the horizontal and vertical offset for the shadow
                                  ),
                                ],
                              ),
                          ),
                        ),
                      ),
                    )),//skip
                const Positioned(
                    bottom: 0,
                    child: BlurBoxWidget(height: 215),
                ),//blur container
                Positioned.fill(
                  bottom: 135,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() =>
                              Text(
                                      controller.onboardingPages[controller.selectedPageIndex.value].title,
                                      style: GoogleFonts.inter(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                        shadows: [
                                          const Shadow(
                                            color: AppColors.black,      // Choose the color of the shadow
                                            blurRadius: 10.0,          // Adjust the blur radius for the shadow effect
                                            offset: Offset(0.0, 4.0), // Set the horizontal and vertical offset for the shadow
                                          ),
                                        ],
                                      ),
                                  ),
                          ),
                        ],
                      ),
                  ),
                ), // Title
                Positioned(
                    left: 30,
                    bottom: 20,
                    child: Obx(
                          () =>InkWell(
                            onTap: controller.isFirstPage ? null : controller.backwardAction,
                            child: SizedBox(
                              width: 72,
                              height: 52,
                              child: Center(
                                child: Text(controller.isFirstPage ? "" : Strings.previous,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.previous,
                                      shadows: [
                                        const Shadow(
                                          color: AppColors.black,      // Choose the color of the shadow
                                          blurRadius: 4.0,          // Adjust the blur radius for the shadow effect
                                          offset: Offset(0.0, 2.0), // Set the horizontal and vertical offset for the shadow
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                            ),
                          )
                    ),),//previous
                Positioned.fill(
                  bottom: 80,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.onboardingPages.length,
                              (index) => Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: controller.selectedPageIndex.value == index
                                    ? AppColors.white
                                    : Colors.grey[700],
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ),
                  ),
                ),//carousal
                Positioned(
                    right: 30,
                    bottom: 20,
                    child: InkWell(
                      onTap: controller.forwardAction,
                      child: SizedBox(
                        width: 72,
                        height: 52,
                        child: Center(
                          child: Text(Strings.next,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.kSecColor,
                                shadows: [
                                  const Shadow(
                                    color: AppColors.black,      // Choose the color of the shadow
                                    blurRadius: 4.0,          // Adjust the blur radius for the shadow effect
                                    offset: Offset(0.0, 2.0), // Set the horizontal and vertical offset for the shadow
                                  ),
                                ],
                              ),
                          ),
                        ),
                      ),
                    )),//next
              ],
            ),
          ),
        ),
      ),
    );
  }
}
