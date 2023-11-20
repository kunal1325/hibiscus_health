import '../../../../import.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
          () => SignUpController(),
    );
  }
}
