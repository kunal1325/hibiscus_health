import '../../../../import.dart';

class OnBoardingController extends GetxController {

  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  bool get isFirstPage => selectedPageIndex.value == 0;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.offAndToNamed("/welcomeScreen");
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  backwardAction() {
    if (isFirstPage) {
      showExitPopup(Get.context);
    } else {
      pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  skipAction() {
    Get.offAndToNamed("/welcomeScreen");
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(AppImages.onBoardOne, Strings.onBoardHeadingOne),
    OnboardingInfo(AppImages.onBoardTwo, Strings.onBoardHeadingTwo),
    OnboardingInfo(AppImages.onBoardThree, Strings.onBoardHeadingThree)
  ];

}
