import '../../../../import.dart';
import 'anura_web_view_controller.dart';

class AnuraWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnuraWebViewController>(
          () => AnuraWebViewController(),
    );
  }
}
