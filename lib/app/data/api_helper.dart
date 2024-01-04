import '../../import.dart';

abstract class ApiHelper {
  Future<Response> login(LoginRequest loginRequest);
  Future<Response> register(RegisterRequest registerRequest);
  Future<Response> helpUs(HelpUsRequest helpUsRequest);
  Future<Response> requestOtp(RegisterRequest registerRequest);
  Future<Response> updatePassword(UpdatePasswordRequest updatePasswordRequest);

  Future<Response> getArticle(int pageNumber, int pageSize,
      String filterCategory, String searchKeyword);

  Future<Response> getCategories();

  Future<Response> getDailyCheckInQuestions();
  Future<Response> postCheckInAnswers(AnsResponse answers);
}
