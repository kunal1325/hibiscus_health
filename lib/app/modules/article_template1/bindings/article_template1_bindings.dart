import 'package:hibiscus_health/import.dart';

class ArticleTemplate1Binding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ArticleTemplate1Controller>(() => ArticleTemplate1Controller());
  }
}