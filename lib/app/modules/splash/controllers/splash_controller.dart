
import '../../../../import.dart';

class SplashController extends GetxController  with GetSingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

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
    var userId = Storage.getValue(Constants.userId);
    var isFaceScanCompleted = Storage.getValue(Constants.isFaceScanCompleted);
    var lastTime = Storage.getValue(Constants.lastTime);
    navigateToRout(userId, isFaceScanCompleted, lastTime);
  }

  navigateToRout(userId, isFaceScanCompleted, lastTime) {
    if (userId == null || userId == "userId") {
      Get.offAndToNamed(Routes.onBoarding);
    } else if (isFaceScanCompleted == null || isFaceScanCompleted == "isFaceScanComplete" || isFaceScanCompleted != true ) {
      Get.offAndToNamed(Routes.startMyJourney);
    } else if (lastTime != null && lastTime != "lastTime") {
      Duration diff = DateTime.now().difference( DateTime.parse(lastTime));
      if(diff.inHours >24){
        Get.offAndToNamed(Routes.dailyCheckinScreen);
      }else{
        Get.offAndToNamed(Routes.landingPage);
      }
    } else {
      Get.offAndToNamed(Routes.landingPage);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
