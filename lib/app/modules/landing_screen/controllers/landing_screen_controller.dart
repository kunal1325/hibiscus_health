import '../../../../import.dart';

class LandingScreenController extends GetxController {
  late PageController pageController;
  var currentIndex = 0.obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() async {
    pageController = PageController(initialPage: 0);
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }
    super.onInit();
  }

  onSelectedIndexChanged(int index) {
    currentIndex.value = index;
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }
}
