import '../../import.dart';

class ApiHelperImpl extends GetConnect implements ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseURLDev;
    httpClient.timeout = Constants.timeout;

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
      if (response.statusCode == 226) {
        Utils.showSnackBarFun(Get.context, "This Email Already Exist....!");
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

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      if (Storage.hasData(Constants.accessToken)) {
        var token = Storage.getValue(Constants.accessToken);
        print("Token $token");
        request.headers['Authorization'] = "Bearer ${token}";
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

  Future<Response<dynamic>> requestOtp(RegisterRequest registerRequest) {
    return post('otp/request/', json.encode(registerRequest.toJson()));
  }

  Future<Response<dynamic>> updatePassword(
      UpdatePasswordRequest updatePasswordRequest) {
    return post('otp/verify-reset-password/',
        json.encode(updatePasswordRequest.toJson()));
  }

    @override
  Future<Response<dynamic>> sentEmail(sentEmail) {
    return post('facescandata/', json.encode(sentEmail.toJson()));
  }

  @override
  Future<Response> getDailyCheckInQuestions() async {
    return get('dailycheckin/');
  }

  @override
  Future<Response<dynamic>> postCheckInAnswers(AnsResponse answers) {
    return post('dailycheckin/', json.encode(answers.toJson()));
  }
}
