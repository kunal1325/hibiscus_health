import 'package:hibiscus_health/import.dart';

class LibraryController extends GetxController {
  final ApiHelper _apiHelper = Get.find();
  List<ArticleModel> articleList = List<ArticleModel>.empty(growable: true).obs;
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;

  static const pageSize = 26;
  var isCategoryLoading = false.obs;
  var isLoading = false.obs;
  var isSearching = false.obs;
  bool isFirst = false;

  var isChipSelected = 0.obs;
  TextEditingController searchKey = TextEditingController();
  final passwordFocusNode = FocusNode();

  late PageController pageController;
  var currentIndex = 0.obs;
  var selectedIndex = 3.obs;

  // var isBusy = false.obs;
  var unreadNotificationFlag = false.obs;

  List<String> screensToGo = ['/articletemplate1', '/articeltemplate2'];

  // List<String> subContentType = [
  //   Strings.all,
  //   'Kidney',
  //   'Hypothyroidism',
  //   'Hyperthyroidism',
  //   'Hypertension',
  //   'ESRD',
  //   'Diabetes',
  //   'Weight',
  //   'Insulin',
  //   'Mental health',
  //   'Obesity'
  // ];


  onSelectedIndexChanged(int index) {
    currentIndex.value = index;
    selectedIndex.value = index;
    pageController.jumpToPage(index);
    pageController.animateToPage(index,
        duration: const Duration(seconds: 300), curve: Curves.slowMiddle);
  }

  @override
  void onReady() {
    getCategories();
    getArticles();
    super.onReady();
  }

  Future<void> getCategories() async {
    isCategoryLoading.value = true;

    _apiHelper.getCategories().futureValue((value) {
      print("👍👍👍👍👍👍👍👍👍👍");
      var categoryResponse = CategoryData.fromJson(value);

      categoryList.assignAll(categoryResponse.data ?? []);
      print("👍👍👍👍👍👍👍👍${categoryList}");
    }, onError: (error) {
      if (kDebugMode) {
        print("Get Categories $error");
      }
    });
    isCategoryLoading.value = false;
  }

  Future<void> getArticles(
      {int pageNumber = 1,
      String filterCategory = "",
      String searchKeyword = ""}) async {
    isLoading.value = true;

    _apiHelper
        .getArticle(pageNumber, pageSize, filterCategory, searchKeyword)
        .futureValue((value) {
      var articlesResponse = ArticleData.fromJson(value);

      articleList.assignAll(articlesResponse.data ?? []);
    }, onError: (error) {
      if (kDebugMode) {
        print("Get Articles $error");
      }
    });
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSearch(String val) {
    if (val.length > 2) {
      getArticles(
          pageNumber: 1,
          filterCategory:
              categoryList[isChipSelected.value].attributes?.categoryName ?? "",
          searchKeyword: val);
    }
  }

  void onChipSelected(int ind) {
    isChipSelected.value = ind;

    print("🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢${searchKey.text}");
    getArticles(
        pageNumber: 1,
        filterCategory: categoryList[ind].attributes?.categoryName ?? "",
        searchKeyword: searchKey.text);
  }

  String? isSearchValueValid(String? text) {
    if (text!.isEmpty) {
      return "Search field empty";
    } else {
      return null;
    }
  }
}
