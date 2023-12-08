import 'package:hibiscus_health/import.dart';

class ArticleTemplate1Controller extends GetxController {
   ArticleAttributes article = ArticleAttributes();
   String refText = "";

  var isRefCollapsed = true.obs;

  late PageController pageController;
  var currentIndex = 0.obs;
  var selectedIndex = 3.obs;
  var isBusy = false.obs;
  var unreadNotificationFlag = false.obs;


  @override
  void onInit() async {
    isBusy.value = true;

    pageController = PageController(initialPage: 0);
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }

    getArticleData();
    getRefText();
    isBusy.value = false;
    super.onInit();
  }

  void getRefText(){
    article.references?.forEach((val) {
      refText =
      refText == ""? val.singleReferenceLink! :
      "$refText\n\n${val.singleReferenceLink!}";
    });
  }

  void getArticleData (){
    try {
      article = Get.arguments[0];
    } catch (e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  onSelectedIndexChanged(int index) {
    currentIndex.value = index;
    selectedIndex.value = index;
    pageController.jumpToPage(index);
    pageController.animateToPage(index,
        duration: const Duration(seconds: 300), curve: Curves.slowMiddle);
  }

  toggle() {
    isRefCollapsed.value = !isRefCollapsed.value;
  }
}