import '../../import.dart';


abstract class ApiHelper {
  Future<Response> login(LoginRequest loginRequest);

}
