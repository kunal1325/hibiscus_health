abstract class Constants {
  static const String baseURLDev =
      'https://coremobileapidev.hibiscushealth.com/';
  static const String baseURLStaging =
      'https://hibiscus-health-core-mobile-api-staging/';
  static const String baseURLProd =
      'https://hibiscus-health-core-mobile-api-prod/';
  static const String baseURLTest = 'http://3.95.83.73:8000/';

  static const String urlConfigId = 'http://assessment.hibiscushealth.com/api/configId';
  static const String urlToken = 'http://assessment.hibiscushealth.com/api/token';
  static const String urlEncryptProfile = 'http://assessment.hibiscushealth.com/api/encrypt-profile';
  static const String baseURLForWebView = 'https://awe.na-east.nuralogix.ai/c';
  static const String uRLForWebViewResultOne = 'https://hibiscushealth.com/results?results=';
  static const String uRLForWebViewResultTwo = 'https://hibiscushealth.com/results?results=';
  static const String uRLForWebViewErrorInvalidBmi = 'https://hibiscushealth.com/results?error=INVALID_BMI';

  static const TERM_CONDITION_URL = "https://hibiscushealth.com/mobile-terms";
  static const PRIVACY_POLICIES_URL = "https://hibiscushealth.com/mobile-privacy";

  
  static const String articleUrl = "api/articles";
  static const String categoryUrl = "api/category-lists";

  static const timeout = Duration(seconds: 30);

  static const String accessToken = 'authToken';
  static const String refreshToken = 'authToken';
  static const String userId = 'userId';
  static const String userEmail = 'userEmail';
  static const String age = 'age';
  static const String dietitianId = 'dietitianID';
  static const String patientName = 'patientName';
  static const String dietitianName = 'dietitianName';
  static const String isFaceScanCompleted = 'isFaceScanCompleted';
  static const String isScanFailed = 'isScanFailed';
  static const String lastTime = 'lastTime';
}
