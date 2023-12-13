import '../../../../import.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) => ConnectivityCheckWidget(
        body: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bg),
                fit: BoxFit.cover,
              ),
              color: AppColors.kPrimaryColor
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.6),
              child: Center(
                // child: Utils.assetSVGImage(AppImages.logoWhite)
                child: FadeTransition(
                  //Use your animation here
                  opacity: controller.animation,
                  child: Utils.assetSVGImage(AppImages.logoWhite, width: 182, height: 74)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
