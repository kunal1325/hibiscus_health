import '../../import.dart';

class ApiHelperImpl extends GetConnect implements ApiHelper {
  @override
  void onInit() {

    addRequestModifier();

    httpClient.addResponseModifier((request, response) {
      printInfo(info: 'Status Code: ${response.statusCode}\n'
          // 'Data: ${response.bodyString?.toString() ?? ''}',
          );
      if (response.statusCode == 401) {
        Storage.clearStorage();
        Get.offAllNamed(
          Routes.signIn,
        );
      }
      if (response.statusCode == 404) {
        Utils.showDialog(
          "Something Went Wrong !!! Like 404",
          onTap: () {
            Get.back();
          },
        );
      }

      return response;
    });
  }

  void setBaseUrl() {
    var baseUrlForApi;
    var baseUrlTag = Storage.getValue(Constants.finalBaseUrlTag);
    print("baseUrlTag====================>>>>>>>>>>> $baseUrlTag");

    switch (baseUrlTag) {
      case 'baseURLTest': {
        baseUrlForApi = Constants.baseURLTest;
        print("baseUrlForApi====================>>>>>>>>>>> $baseUrlForApi");
      } break;
      case 'baseURLDev': {
        baseUrlForApi = Constants.baseURLDev;
        print("baseUrlForApi====================>>>>>>>>>>> $baseUrlForApi");
      } break;
      case 'baseURLStaging': {
        baseUrlForApi = Constants.baseURLStaging;
        print("baseUrlForApi====================>>>>>>>>>>> $baseUrlForApi");
      } break;
      case 'baseURLProd': {
        baseUrlForApi = Constants.baseURLProd;
        print("baseUrlForApi====================>>>>>>>>>>> $baseUrlForApi");
      } break;
      case 'baseUrlStrapi': {
        baseUrlForApi = Constants.baseUrlStrapi;
        print("baseUrlForApi====================>>>>>>>>>>> $baseUrlForApi");
      } break;
      default: {
        baseUrlForApi = Constants.baseURLDev;
        print("baseUrlForApi====================>>>>>>>>>>> $baseUrlForApi");
      } break;
    }


    httpClient.baseUrl = baseUrlForApi;
    httpClient.timeout = Constants.timeout;
  }

  void addRequestModifier() {
    setBaseUrl();
    httpClient.addRequestModifier<dynamic>((request) {
      var baseUrlTag = Storage.getValue(Constants.finalBaseUrlTag);
      if (Storage.hasData(Constants.accessToken) && baseUrlTag != "baseUrlStrapi") {
        var token = Storage.getValue(Constants.accessToken);
        print("Token $token");
        var tokenResponse = TokenResponse.fromJson(token);
        request.headers['Authorization'] = "Bearer ${tokenResponse.result}";
      }

      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response<dynamic>> login(loginRequest) {
    return post('login/', json.encode(loginRequest.toJson()));
  }

  @override
  Future<Response<dynamic>> register(RegisterRequest registerRequest) {
    return post('register/', json.encode(registerRequest.toJson()));
  }

  Future<Response<dynamic>> helpUs(HelpUsRequest helpUsRequest) {
    return post('helpus/', json.encode(helpUsRequest.toJson()));
  }

  @override
  Future<Response<dynamic>> getArticle(int pageNumber, int pageSize,
      String filterCategory, String searchKeyword) {
    final queryParameters = {
      "populate": "deep",
      'pagination[page]': pageNumber.toString(),
      'pagination[pageSize]': pageSize.toString(),
      if (searchKeyword.isNotEmpty)
        'filters[Title][\$containsi]': searchKeyword,
      if (filterCategory.isNotEmpty && filterCategory.toLowerCase() != "all")
        'filters[Category][\$containsi]': filterCategory
    };
    return get(Constants.articleUrl, query: queryParameters);
  }

  @override
  Future<Response<dynamic>> getCategories() {
    final queryParam = {
      'fields[1]': 'category_name',
      'pagination[pageSize]': '100',
      'sort[1]': 'category_name',
    };
    return get(Constants.categoryUrl, query: queryParam);
  }
}
