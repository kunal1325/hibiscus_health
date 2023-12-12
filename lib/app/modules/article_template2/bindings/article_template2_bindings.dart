import 'package:hibiscus_health/import.dart';

class ArticleTemplate2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleTemplate2Controller>(() => ArticleTemplate2Controller());
  }
}
