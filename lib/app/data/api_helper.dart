import '../../import.dart';


abstract class ApiHelper {
  Future<Response> login(LoginRequest loginRequest);

  Future<Response> register(RegisterRequest registerRequest);

}
