import 'dart:ui';

import '../../../../import.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) => Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          color: AppColors.kPrimaryColor,
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
                  right: 30,
                  top: 70,
                  child: InkWell(
                    onTap: controller.skipAction,
                    child: const Text("Skip",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white)),
                  )),
              Positioned(
                  bottom: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                      child: Container(
                        width: Get.width,
                        height: 215,
                        // color: AppColors.kPrimaryColor.withOpacity(.2),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff475569).withOpacity(.4),
                              const Color(0xff0F172A).withOpacity(1)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
              ),//blur container
              Positioned.fill(
                bottom: 150,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        1,
                            (index) => Obx(
                              () =>Text(
                              controller.onboardingPages[controller.selectedPageIndex.value].title,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white)
                          ),
                        ),
                      ),
                    ),
                ),
              ),
              Positioned(
                  left: 40,
                  bottom: 30,
                  child: Obx(
                        () =>InkWell(
                          onTap: controller.isFirstPage ? null : controller.backwardAction,
                          child: SizedBox(
                            width: 72,
                            height: 52,
                            child: Center(
                              child: Text(controller.isFirstPage ? "" : "Previous",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white)),
                            ),
                          ),
                        )
                  ),),//skip
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
                                  ? AppColors.kSecColor
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),
                    ),
                ),
              ),//carousal
              Positioned(
                  right: 40,
                  bottom: 30,
                  child: InkWell(
                    onTap: controller.forwardAction,
                    child: const SizedBox(
                      width: 72,
                      height: 52,
                      child: Center(
                        child: Text("Next",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kSecColor)),
                      ),
                    ),
                  )),//next

            ],
          ),
        ),
      ),
    );
  }
}
