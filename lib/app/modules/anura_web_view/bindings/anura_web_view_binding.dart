import '../../../../import.dart';

class AnuraWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnuraWebViewController>(
          () => AnuraWebViewController(),
    );
  }
}
