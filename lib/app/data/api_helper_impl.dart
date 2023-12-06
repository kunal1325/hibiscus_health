import '../../import.dart';

class ApiHelperImpl extends GetConnect implements ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseURLDev;
    // httpClient.baseUrl = Constants.baseURLStaging;
    // httpClient.baseUrl = Constants.baseURLProd;
    // httpClient.baseUrl = Constants.baseURLTest;
    httpClient.timeout = Constants.timeout;

    addRequestModifier();

    httpClient.addResponseModifier((request, response) {
      printInfo(
        info: 'Status Code: ${response.statusCode}\n'
            'Data: ${response.bodyString?.toString() ?? ''}',
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

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      if (Storage.hasData(Constants.accessToken)) {
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

}
