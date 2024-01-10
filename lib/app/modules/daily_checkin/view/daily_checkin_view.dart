import 'package:hibiscus_health/import.dart';

class DailyCheckinView extends GetView<DailyCheckinController> {
  const DailyCheckinView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyCheckinController>(
      init: DailyCheckinController(),
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
                                    const SizedBox(height: 70),
                                    Text(
                                      Strings.reminderTomorrow,
                                      style: Utils.kParagraphTextStyle
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ))
                            : ListView.builder(
                                itemCount: controller.checkInQuestions.length,
                                itemBuilder: (context, ind) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Obx(
                                      () => Visibility(
                                        visible: controller
                                                .currentQuestionIndex.value ==
                                            ind,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
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
                                              unselectedColor: AppColors.grey,
                                              padding: 7,
                                              size: 3,
                                            ),
                                            const SizedBox(height: 30),
                                            Text(
                                              Strings.dailyCheckIn,
                                              style: Utils.kParagraphTextStyle
                                                  .copyWith(
                                                      color: AppColors.white,
                                                      fontSize: 17),
                                            ),
                                            const SizedBox(height: 40),
                                            Container(
                                              height: 50,
                                              width: Get.width / 2.2,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: AppColors.grey
                                                      .withOpacity(0.5)),
                                              child: Center(
                                                child: Text(
                                                  "${controller.checkInQuestions[ind].fields?.label}",
                                                  style: Utils
                                                      .kParagraphTextStyle
                                                      .copyWith(
                                                          color:
                                                              AppColors.white),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 50),
                                            Text(
                                              "${controller.checkInQuestions[ind].fields?.question}",
                                              style: Utils.kVeryLargeText
                                                  .copyWith(
                                                      color: AppColors.white),
                                            ),
                                            const SizedBox(height: 30),
                                            Wrap(
                                              children: List.generate(
                                                controller.options[ind].length,
                                                (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Obx(
                                                    () => Theme(
                                                      data: ThemeData(
                                                        splashColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          if (controller.answers
                                                                  .length ==
                                                              ind + 1) {
                                                            controller.answers[
                                                                ind] = controller
                                                                    .options[
                                                                ind][index];
                                                          } else {
                                                            controller.answers
                                                                .add(controller
                                                                        .options[
                                                                    ind][index]);
                                                          }

                                                          controller
                                                              .selectedOptionIndex
                                                              .value = index + 1;
                                                        },
                                                        child: Card(
                                                          elevation: 0,
                                                          color: controller
                                                                          .selectedOptionIndex
                                                                          .value -
                                                                      1 ==
                                                                  index
                                                              ? AppColors
                                                                  .kLightBlue
                                                              : AppColors
                                                                  .kLightBlue
                                                                  .withOpacity(
                                                                      0.2),
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  30),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        15.0,
                                                                    horizontal:
                                                                        25),
                                                            child: Text(
                                                              "${controller.options[ind][index]}",
                                                              // "${controller.checkInQuestions[ind].fields?.options?[index]}",
                                                              style: Utils
                                                                  .kParagraphTextStyle
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .white),
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
                                  );
                                },
                              ),
                        Obx(
                          () => Visibility(
                            visible: controller.currentQuestionIndex.value !=
                                controller.checkInQuestions.length,
                            child: Positioned(
                              bottom: 30,
                              child: InkWell(
                                onTap:
                                    //When no option has been selected
                                    (controller.selectedOptionIndex.value == 100
                                        ? null
                                        : (
                                            //When answered all the questions including 6th one
                                            controller.currentQuestionIndex ==
                                                    controller.checkInQuestions
                                                            .length -
                                                        1
                                                ? () {
                                                    controller.postAnswers();
                                                    controller
                                                        .currentQuestionIndex
                                                        .value++;
                                                    controller
                                                        .delayedNavigation();
                                                  }
                                                : () {
                                                    //When answered 'A' for question 4 AND/OR 'B' for option 5
                                                    if (controller
                                                                .currentQuestionIndex
                                                                .value ==
                                                            4 &&
                                                        (controller.answers[
                                                                    3] !=
                                                                controller
                                                                        .options[
                                                                    3][0] &&
                                                            controller.answers[
                                                                    4] !=
                                                                controller
                                                                        .options[
                                                                    4][1])) {
                                                      controller.postAnswers();
                                                      controller
                                                          .currentQuestionIndex
                                                          .value += 2;
                                                      controller
                                                          .delayedNavigation();
                                                    } else {
                                                      controller
                                                          .currentQuestionIndex
                                                          .value++;
                                                      controller
                                                          .selectedOptionIndex
                                                          .value = 100;
                                                    }
                                                  })),
                                child: CustomButtons(
                                  weight: Get.width - 40,
                                  height: 50,
                                  color: controller.selectedOptionIndex.value ==
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
