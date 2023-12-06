import '../../import.dart';

abstract class ApiHelper {
  Future<Response> login(LoginRequest loginRequest);
  Future<Response> register(RegisterRequest registerRequest);

  Future<Response> helpUs(HelpUsRequest helpUsRequest);

  Future<Response> getArticle(int pageNumber, int pageSize,
      String filterCategory, String searchKeyword);

  Future<Response> getCategories();
}
