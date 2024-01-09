import '../../../../import.dart';

class StartMyJourneyView extends GetView<StartMyJourneyController> {
  const StartMyJourneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartMyJourneyController>(
      init: StartMyJourneyController(),
      builder: (controller) => ConnectivityCheckWidget(
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            showExitPopup(Get.context);
            return;
          },
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
                color: Colors.black.withOpacity(0.6),
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
                        child: Obx(
                          () => Container(
                            width: Get.width,
                            height: controller.isFaceScanCompleted.value
                                ? Get.height / 1.3
                                : Get.height / 1.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(17),
                                  topRight: Radius.circular(17)),
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                                child: Obx(
                              () => Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  controller.isFaceScanCompleted.value
                                      ? Utils.assetSVGImage(AppImages.checked,
                                          width: 153, height: 87)
                                      : Utils.assetImage(AppImages.handShake,
                                          width: 153,
                                          height: 87,
                                          boxFit: BoxFit.cover),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.isFaceScanCompleted.value
                                        ? Strings.faceScanCompleted
                                        : "${Strings.welcome} ${controller.patientName.value}",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.isFaceScanCompleted.value
                                        ? Strings.resultsReady
                                        : Strings.profileSuccessfullyCreated,
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.kPrimaryColorText,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Column(
                                    children: List.generate(
                                      controller.startMyJourneyModel.length,
                                      (index) => Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                index == 0 ||
                                                        (controller
                                                                .isFaceScanCompleted
                                                                .value &&
                                                            index == 1)
                                                    ? Utils.assetSVGImage(
                                                        AppImages.checked,
                                                        width: 25,
                                                        height: 25)
                                                    : Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 7,
                                                                vertical: 7),
                                                        child: Utils.assetSVGImage(
                                                            AppImages
                                                                .privacyFirstFlower,
                                                            width: 11,
                                                            height: 11),
                                                      ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                        .startMyJourneyModel[
                                                            index]
                                                        .title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: index == 0 ||
                                                              (controller
                                                                      .isFaceScanCompleted
                                                                      .value &&
                                                                  index == 1)
                                                          ? AppColors
                                                              .avgSecColor
                                                          : AppColors
                                                              .kPrimaryColorText,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 35),
                                              child: index == 0
                                                  ? Row(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      10),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        21),
                                                            color: AppColors
                                                                .lightSecColor,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                  child: Utils.assetImage(
                                                                      AppImages
                                                                          .dummy,
                                                                      width: 25,
                                                                      height:
                                                                          25)),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Obx(
                                                                () => Text(
                                                                  "${controller.dietitianName.value}",
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: AppColors
                                                                        .darkSecColor,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Text(
                                                      controller
                                                          .startMyJourneyModel[
                                                              index]
                                                          .description,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 4,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: index == 0 ||
                                                                (controller
                                                                        .isFaceScanCompleted
                                                                        .value &&
                                                                    index == 1)
                                                            ? AppColors
                                                                .avgSecColor
                                                            : AppColors
                                                                .kPrimaryColorText,
                                                      ),
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 47,
                                  ),
                                  controller.isFaceScanCompleted.value
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.navigateToLanding();
                                              },
                                              child: CustomButtons(
                                                weight: Get.width / 3 - 10,
                                                height: 50,
                                                color: AppColors.white,
                                                shadowColor:
                                                    Colors.grey.shade400,
                                                borderRadius: 6,
                                                title: Strings.tryLater,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontColor: AppColors.grey,
                                                withShadow: false,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // controller.navigateToFaceScan();
                                              },
                                              child: CustomButtons(
                                                weight: Get.width / 2,
                                                height: 50,
                                                color: AppColors.kSecColor,
                                                shadowColor:
                                                    AppColors.kSecColor,
                                                borderRadius: 6,
                                                title: Strings.checkIn,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontColor:
                                                    AppColors.kPrimaryColor,
                                                withShadow: false,
                                              ),
                                            ),
                                          ],
                                        )
                                      : InkWell(
                                          onTap: () {
                                            controller.navigateToFaceScan();
                                          },
                                          child: CustomButtons(
                                            weight: Get.width - 40,
                                            height: 50,
                                            color: AppColors.kSecColor,
                                            shadowColor: AppColors.kSecColor,
                                            borderRadius: 6,
                                            title: Strings.startMyJourney,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontColor: AppColors.kPrimaryColor,
                                            withShadow: false,
                                          )),
                                  SizedBox(
                                    height: 35,
                                  ),
                                ],
                              ),
                            )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
