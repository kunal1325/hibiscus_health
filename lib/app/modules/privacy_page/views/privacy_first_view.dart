import '../../../../import.dart';

class PrivacyFirstView extends GetView<PrivacyFirstController> {
  const PrivacyFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyFirstController>(
      init: PrivacyFirstController(),
      builder: (controller) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bg2),
              fit: BoxFit.cover,
            ),
            color: AppColors.kPrimaryColor
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.6),
            child: Stack(
              children: [
                Positioned.fill(
                  top: Get.width/3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Utils.assetSVGImage(AppImages.logoWhite, width: 141, height: 57),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: Get.width,
                    height: Get.height/1.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(17), topRight: Radius.circular(17)),
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Utils.assetImage(AppImages.privacyPolicyIcon, width: 64, height: 64),
                          SizedBox(height: 5,),
                          Text(
                            Strings.privacyFirst,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Column(
                            children: List.generate(
                              controller.privacyFirstModel.length,
                                  (index) => Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Utils.assetSVGImage(AppImages.privacyFirstFlower, width: 10, height: 10),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: Text(
                                          controller.privacyFirstModel[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.kPrimaryColorText,
                                            letterSpacing: 0.40,
                                            height: 1.2
                                          ),
                                      ),
                                    )
                                ],
                              ),
                                  ),
                            ),
                          ),
                          SizedBox(height: 47,),
                          InkWell(
                              onTap: () {
                                // controller.navigationAction("/signIn");
                              },
                              child: CustomButtons(
                                weight: Get.width- 40,
                                height: 50,
                                color: AppColors.kSecColor,
                                shadowColor: AppColors.kSecColor,
                                borderRadius: 6,
                                title: Strings.iConsent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontColor: AppColors.kPrimaryColor,
                                withShadow: true,
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                // Blur box
              ],
            )
          ),
        ),
      ),
    );
  }
}
