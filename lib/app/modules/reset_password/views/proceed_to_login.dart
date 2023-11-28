import '../../../../import.dart';

class ProcessToLoginView extends GetView<ResetPasswordController> {
  const ProcessToLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      init: ResetPasswordController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => showExitPopup(Get.context),
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.bg2),
                  fit: BoxFit.cover,
                ),
                color: AppColors.kPrimaryColor),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.3),
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: Get.width / 4,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Utils.assetSVGImage(AppImages.logoWhite,
                            width: 141, height: 57),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          width: Get.width,
                          height: Get.height / 1.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(17),
                                topRight: Radius.circular(17)),
                            color: AppColors.white,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                Utils.assetSVGImage(
                                    AppImages.checked,
                                    width: 90,
                                    height: 90),
                                SizedBox(
                                  height: 26,
                                ),
                                Container(
                                  width: 180,
                                  child: Center(
                                    child: Text(
                                      Strings.passwordUpdatedSuccessfully,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.kPrimaryColorText,
                                        height: 1.5
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 87,
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.navigateToSignIn();
                                    },
                                    child: CustomButtons(
                                      weight: Get.width - 40,
                                      height: 50,
                                      color: AppColors.kSecColor,
                                      shadowColor: AppColors.kSecColor,
                                      borderRadius: 6,
                                      title: Strings.proceedLogin,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontColor: AppColors.kPrimaryColor,
                                      withShadow: false,
                                    )),
                              ],
                            ),
                          ),
                        )),
                    // Blur box
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
