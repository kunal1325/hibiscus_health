import 'package:hibiscus_health/import.dart';

class InitialCheckinView extends GetView<InitialCheckinController> {
  const InitialCheckinView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitialCheckinController>(
      init: InitialCheckinController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                          color: AppColors.kLightBlue),
                    )
                  : Stack(
                      children: [
                        Container(),
                        controller.currentQuestionIndex.value ==
                                controller.checkInQuestions.length
                            ? (Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor:
                                          AppColors.kSecColor.withOpacity(.3),
                                      child: Utils.assetSVGImage(
                                          AppImages.greenVerified,
                                          height: 80),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Great job ${controller.patient}!",
                                      style: Utils.kBigText.copyWith(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      Strings.completedTodayCheckIn,
                                      style: Utils.kParagraphTextStyle
                                          .copyWith(color: AppColors.white),
                                    ),
                                    const SizedBox(height: 150),
                                    Text(
                                      Strings.tillNextTime,
                                      style: Utils.kParagraphTextStyle
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ))
                            : Column(
                                children: [
                                  ListView.builder(
                                    itemCount:
                                        controller.checkInQuestions.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, ind) {
                                      return Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Obx(
                                          () => Visibility(
                                            visible: controller
                                                    .currentQuestionIndex
                                                    .value ==
                                                ind,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 60),
                                                StepProgressIndicator(
                                                  totalSteps: controller
                                                      .checkInQuestions.length,
                                                  currentStep: ind + 1,
                                                  selectedColor:
                                                      AppColors.kSecColor,
                                                  unselectedColor:
                                                      AppColors.grey,
                                                  padding: 7,
                                                  size: 3,
                                                ),
                                                SizedBox(
                                                  height: Get.height * .8,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(height: 20),
                                                        Text(
                                                          Strings
                                                              .initialAssessment,
                                                          style: Utils
                                                              .kParagraphTextStyle
                                                              .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  fontSize: 17),
                                                        ),
                                                        const SizedBox(
                                                            height: 30),
                                                        Text(
                                                          "${controller.checkInQuestions[ind].fields?.question}",
                                                          style: Utils
                                                              .kVeryLargeText
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .white),
                                                        ),
                                                        const SizedBox(
                                                            height: 30),
                                                        Wrap(
                                                          children:
                                                              List.generate(
                                                            controller
                                                                .options[ind]
                                                                .length,
                                                            (index) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0.0),
                                                              child: Obx(
                                                                () => Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      if (controller
                                                                              .answers
                                                                              .length ==
                                                                          ind +
                                                                              1) {
                                                                        controller
                                                                            .answers[ind] = controller
                                                                                .options[ind]
                                                                            [
                                                                            index];
                                                                      } else {
                                                                        controller
                                                                            .answers
                                                                            .add(controller.options[ind][index]);
                                                                      }

                                                                      controller
                                                                              .selectedOptionIndex
                                                                              .value =
                                                                          index +
                                                                              1;
                                                                    },
                                                                    child: Card(
                                                                      elevation:
                                                                          0,
                                                                      color: controller.selectedOptionIndex.value - 1 ==
                                                                              index
                                                                          ? AppColors
                                                                              .kLightBlue
                                                                          : AppColors
                                                                              .kLightBlue
                                                                              .withOpacity(0.2),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          controller.options[ind].length == 10
                                                                              ? Radius.circular(6)
                                                                              : Radius.circular(30),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                15.0,
                                                                            horizontal: controller.options[ind].length == 10
                                                                                ? 20
                                                                                : 25),
                                                                        child:
                                                                            Text(
                                                                          "${controller.options[ind][index]}",
                                                                          // "${controller.checkInQuestions[ind].fields?.options?[index]}",
                                                                          style: Utils
                                                                              .kParagraphTextStyle
                                                                              .copyWith(color: AppColors.white),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 40),
                                ],
                              ),
                        Obx(
                          () => Visibility(
                            visible: controller.currentQuestionIndex.value !=
                                controller.checkInQuestions.length,
                            child: Positioned(
                              bottom: 30,
                              child: InkWell(
                                onTap: controller.onNextClick(),
                                child: Container(
                                  color: AppColors.kPrimaryColor,
                                  child: CustomButtons(
                                    weight: Get.width - 40,
                                    height: 50,
                                    color: controller
                                                .selectedOptionIndex.value ==
                                            100
                                        ? AppColors.kSecColor.withOpacity(0.2)
                                        : AppColors.kSecColor,
                                    shadowColor: AppColors.transparent,
                                    borderRadius: 10,
                                    title: Strings.next,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontColor: AppColors.kPrimaryColor,
                                    withShadow: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
