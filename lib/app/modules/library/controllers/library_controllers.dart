import 'package:hibiscus_health/import.dart';

class LibraryController extends GetxController {
  final ApiHelper _apiHelper = Get.find();
  List<ArticleModel> articleList = List<ArticleModel>.empty(growable: true).obs;
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;

  static const pageSize = 120;

  var isCategoryLoading = false.obs;
  var isArticlesLoading = false.obs;
  var isSearching = false.obs;

  var isChipSelected = 0.obs;
  TextEditingController searchKey = TextEditingController();

  List<String> screensToGo = [
    Routes.articleTemplate1Screen,
    Routes.articleTemplate2Screen
  ];

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    isCategoryLoading.value = true;
    isArticlesLoading.value = true;
    _apiHelper.getCategories().futureValue((value) {
      var categoryResponse = CategoryData.fromJson(value);

      categoryList.assignAll(categoryResponse.data ?? []);
      getArticles();
      isCategoryLoading.value = false;
    }, onError: (error) {
      if (kDebugMode) {
        print("Get Categories $error");
      }
      isCategoryLoading.value = false;
    });
  }

  Future<void> getArticles(
      {int pageNumber = 1,
      String filterCategory = "",
      String searchKeyword = ""}) async {
    isArticlesLoading.value = true;
    _apiHelper
        .getArticle(pageNumber, pageSize, filterCategory, searchKeyword)
        .futureValue((value) {
      var articlesResponse = ArticleData.fromJson(value);

      articleList.assignAll(articlesResponse.data ?? []);
      isArticlesLoading.value = false;
    }, onError: (error) {
      if (kDebugMode) {
        print("Get Articles $error");
      }
      isArticlesLoading.value = false;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetFilters() {
    isChipSelected.value = 0;
    searchKey.text = "";
    getArticles();
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

    getArticles(
        pageNumber: 1,
        filterCategory: categoryList[ind].attributes?.categoryName ?? "",
        searchKeyword: searchKey.text);
  }

  String? isSearchValueValid(String? text) {
    if (text!.isEmpty) {
      return "Search field empty";
    } else if (text.length < 2) {
      return "Enter at least 3 letters";
    } else {
      return null;
    }
  }
}
