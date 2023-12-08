abstract class Constants {
  static const String baseURLDev =
      'https://coremobileapidev.hibiscushealth.com/';
  static const String baseURLStaging =
      'https://hibiscus-health-core-mobile-api-staging/';
  static const String baseURLProd =
      'https://hibiscus-health-core-mobile-api-prod/';
  static const String baseURLTest = 'http://3.95.83.73:8000/';
  static const String baseUrlStrapi = "https://cms.hibiscushealth.com/";

  static const String finalBaseUrlTag = "finalBaseUrlTag";



  static const String articleUrl = "api/articles";
  static const String categoryUrl = "api/category-lists";

  static const timeout = Duration(seconds: 30);

  static const String accessToken = 'authToken';
  static const String refreshToken = 'authToken';
  static const String userId = 'userId';
  static const String dietitianId = 'dietitianID';
  static const String patientName = 'patientName';
  static const String dietitianName = 'dietitianName';
}
