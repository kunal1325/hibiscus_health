
import '../../../../import.dart';

class SplashController extends GetxController  with GetSingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;


  var userId = "".obs;

  @override
  Future<void> onInit() async {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);
    controller.forward();
    loadData();
    super.onInit();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 4), onDoneLoading);
  }

  onDoneLoading() async {
    navigateToRout(1);
  }

  navigateToRout(userId) {
    if (userId == "") {
      Get.back();
    } else {
      Get.toNamed("/onBoarding");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
