import '../../../../import.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) => Scaffold(
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
              child: Stack(
                children: [
                  Positioned.fill(
                    top: Get.width/3,
                    child: Align(
                        alignment: Alignment.topCenter,
                      child: Utils.assetSVGImage(AppImages.logoWhite, width: 141, height: 57),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    child: BlurBoxWidget(height: 315),
                  ),
                  Positioned.fill(
                    bottom: 230,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        Strings.welcomeHeading,
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          shadows: [
                            const Shadow(
                              color: AppColors.black,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 4.0), 
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 140,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                          onTap: () {
                            controller.navigationAction("/createAccount");
                          },
                        child: CustomButtons(
                          weight: Get.width- 40,
                          height: 50,
                          color: AppColors.kSecColor,
                          shadowColor: AppColors.kSecColor,
                          borderRadius: 10,
                          title: Strings.createAccount,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontColor: AppColors.kPrimaryColor,
                        )
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 60,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          controller.navigationAction("/signIn");
                        },
                        child: CustomButtons(
                          weight: Get.width- 40,
                          height: 50,
                          color: AppColors.white,
                          shadowColor: AppColors.previous,
                          borderRadius: 10,
                          title: Strings.signIn,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontColor: AppColors.kPrimaryColor,
                        )
                      ),
                    ),
                  ),
                  // Blur box
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
