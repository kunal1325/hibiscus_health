import '../../../../import.dart';

class RequestSubmittedView extends GetView<HelpUsController> {
  const RequestSubmittedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpUsController>(
      init: HelpUsController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => showExitPopup(Get.context),
        child: Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Utils.assetSVGImage(AppImages.checked, height: 106, width: 106),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        Strings.requestSent,
                        style: GoogleFonts.inter(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        Strings.requestSentDescription,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kPrimaryColorText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 57,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: InkWell(
                        onTap: () {
                          Get.off(WelcomeView());
                        },
                        child: CustomButtons(
                          weight: Get.width- 40,
                          height: 50,
                          color: AppColors.kSecColor,
                          shadowColor: AppColors.kSecColor,
                          borderRadius: 10,
                          title: Strings.done,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontColor: AppColors.kPrimaryColor,
                          withShadow: false,
                        )
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

