import '../../../../import.dart';

class FaceScanDescriptionView extends GetView<FaceScanDescriptionController> {
  
  const FaceScanDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaceScanDescriptionController>(
      init: FaceScanDescriptionController(),
      builder: (controller) => ConnectivityCheckWidget(
          body: Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Obx(() =>  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Strings.faceScan,
                        style: GoogleFonts.inter(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    Strings.faceScanDescription,
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kPrimaryColorText,
                        height: 1.3),
                  ),
                  controller.isScanFailed.value
                      ? SizedBox(
                    height: Get.width / 2.2,
                  )
                      : SizedBox(
                    height: 30,
                  ),
                  controller.isScanFailed.value
                      ? Utils.assetSVGImage(AppImages.scanFailed,
                      width: 85, height: 85)
                      : Utils.assetImage(AppImages.faceScan,
                      width: 320, height: 320),
                  controller.isScanFailed.value
                      ? SizedBox(
                    height: 30,
                  )
                      : SizedBox(),
                  controller.isScanFailed.value
                      ? Text(
                    Strings.scanFailed,
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                        height: 1.3),
                  )
                      : SizedBox(),
                  controller.isScanFailed.value
                      ? SizedBox()
                      : SizedBox(
                    height: 30,
                  ),
                  controller.isScanFailed.value
                      ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: Text(
                      Strings.scanFailedDescription,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kPrimaryColorText,
                          height: 1.3),
                    ),
                  )
                      : Column(
                    children: List.generate(
                      controller.faceScanModel.length,
                          (index) => Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Utils.assetSVGImage(
                                  AppImages.privacyFirstFlower,
                                  width: 10,
                                  height: 10),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                controller.faceScanModel[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color:
                                    AppColors.kPrimaryColorText,
                                    letterSpacing: 0.40,
                                    height: 1.6),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  controller.isScanFailed.value
                      ? SizedBox(
                    height: Get.width / 3,
                  )
                      : SizedBox(
                    height: 47,
                  ),
                ],
              ))
            ),
          ),
      )
    );
  }
}

