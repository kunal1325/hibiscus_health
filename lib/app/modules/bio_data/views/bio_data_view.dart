import '../../../../import.dart';

class BioDataView extends GetView<BioDataController> {
  const BioDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BioDataController>(
      init: BioDataController(),
      builder: (controller) =>
          ConnectivityCheckWidget(
            body: Scaffold(
              backgroundColor: AppColors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        Strings.answerTheseQuestions,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Text(
                        Strings.gender,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                            () =>
                            Wrap(
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: InkWell(
                                      onTap: () => controller.changeGenderStatus(Strings.male),
                                      child: SelectButtonTextWidget(
                                        color: controller.gender.value == Strings.male
                                            ? AppColors.darkSelectedColor
                                            : AppColors.kSecColorNotSelected,
                                        fontColor: controller.gender.value ==
                                            Strings.male
                                            ? AppColors.white
                                            : AppColors.kDarkGreenColorText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        title: String`s.maleCapital,
                                        borderRadius: 25,
                                        paddingHorizontal: 30,
                                        paddingVertical: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 21,
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: InkWell(
                                      onTap: () =>
                                          controller.changeGenderStatus(
                                              Strings.female),
                                      child: SelectButtonTextWidget(
                                        color: controller.gender.value ==
                                            Strings.female
                                            ? AppColors.darkSelectedColor
                                            : AppColors.kSecColorNotSelected,
                                        fontColor: controller.gender.value ==
                                            Strings.female
                                            ? AppColors.white
                                            : AppColors.kDarkGreenColorText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        title: Strings.femaleCapital,
                                        borderRadius: 25,
                                        paddingHorizontal: 30,
                                        paddingVertical: 15,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        Strings.smoke,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                            () =>
                            Wrap(
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: InkWell(
                                      onTap: () => controller.changeSmokeStatus(Strings.yes),
                                      child: SelectButtonTextWidget(
                                        color: controller.smoke.value == Strings.yes
                                            ? AppColors.darkSelectedColor
                                            : AppColors.kSecColorNotSelected,
                                        fontColor: controller.smoke.value ==
                                            Strings.yes
                                            ? AppColors.white
                                            : AppColors.kDarkGreenColorText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        title: Strings.yesCapital,
                                        borderRadius: 25,
                                        paddingHorizontal: 30,
                                        paddingVertical: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 21,
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: InkWell(
                                      onTap: () => controller.changeSmokeStatus(Strings.no),
                                      child: SelectButtonTextWidget(
                                        color: controller.smoke.value == Strings.no
                                            ? AppColors.darkSelectedColor
                                            : AppColors.kSecColorNotSelected,
                                        fontColor: controller.smoke.value ==
                                            Strings.no
                                            ? AppColors.white
                                            : AppColors.kDarkGreenColorText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        title: Strings.noCapital,
                                        borderRadius: 25,
                                        paddingHorizontal: 30,
                                        paddingVertical: 15,
                                      ),
                                    ),
                                  )
                                ]
                            ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        Strings.hypertension,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                              () => Wrap(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                      ),
                                      child: InkWell(
                                        onTap: () => controller.changeHypertensionStatus(Strings.yes),
                                        child: SelectButtonTextWidget(
                                          color: controller.hypertension.value == Strings.yes
                                              ? AppColors.darkSelectedColor
                                              : AppColors.kSecColorNotSelected,
                                          fontColor: controller.hypertension.value ==
                                              Strings.yes
                                              ? AppColors.white
                                              : AppColors.kDarkGreenColorText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          title: Strings.yesCapital,
                                          borderRadius: 25,
                                          paddingHorizontal: 30,
                                          paddingVertical: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                      ),
                                      child: InkWell(
                                        onTap: () => controller.changeHypertensionStatus(Strings.no),
                                        child: SelectButtonTextWidget(
                                          color: controller.hypertension.value == Strings.no
                                              ? AppColors.darkSelectedColor
                                              : AppColors.kSecColorNotSelected,
                                          fontColor: controller.hypertension.value ==
                                              Strings.no
                                              ? AppColors.white
                                              : AppColors.kDarkGreenColorText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          title: Strings.noCapital,
                                          borderRadius: 25,
                                          paddingHorizontal: 30,
                                          paddingVertical: 15,
                                        ),
                                      ),
                                    )
                                  ]
                              ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        Strings.bloodPressureMedication,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                              () =>
                                  Wrap(
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                          ),
                                          child: InkWell(
                                            onTap: () => controller.changeBloodPressureStatus(Strings.yes),
                                            child: SelectButtonTextWidget(
                                              color: controller.bloodPressure.value == Strings.yes
                                                  ? AppColors.darkSelectedColor
                                                  : AppColors.kSecColorNotSelected,
                                              fontColor: controller.bloodPressure.value ==
                                                  Strings.yes
                                                  ? AppColors.white
                                                  : AppColors.kDarkGreenColorText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              title: Strings.yesCapital,
                                              borderRadius: 25,
                                              paddingHorizontal: 30,
                                              paddingVertical: 15,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 21,
                                        ),
                                        Theme(
                                          data: ThemeData(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                          ),
                                          child: InkWell(
                                            onTap: () => controller.changeBloodPressureStatus(Strings.no),
                                            child: SelectButtonTextWidget(
                                              color: controller.bloodPressure.value == Strings.no
                                                  ? AppColors.darkSelectedColor
                                                  : AppColors.kSecColorNotSelected,
                                              fontColor: controller.bloodPressure.value ==
                                                  Strings.no
                                                  ? AppColors.white
                                                  : AppColors.kDarkGreenColorText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              title: Strings.noCapital,
                                              borderRadius: 25,
                                              paddingHorizontal: 30,
                                              paddingVertical: 15,
                                            ),
                                          ),
                                        )
                                      ]
                                  ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        Strings.diabetic,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                              () =>
                                  Wrap(
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                          ),
                                          child: InkWell(
                                            onTap: () => controller.changeDiabeticStatus(Strings.no),
                                            child: SelectButtonTextWidget(
                                              color: controller.diabetic.value == Strings.no
                                                  ? AppColors.darkSelectedColor
                                                  : AppColors.kSecColorNotSelected,
                                              fontColor: controller.diabetic.value ==
                                                  Strings.no
                                                  ? AppColors.white
                                                  : AppColors.kDarkGreenColorText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              title: Strings.noCapital,
                                              borderRadius: 25,
                                              paddingHorizontal: 30,
                                              paddingVertical: 15,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 21,
                                        ),
                                        Theme(
                                          data: ThemeData(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                          ),
                                          child: InkWell(
                                            onTap: () => controller.changeDiabeticStatus(Strings.type1),
                                            child: SelectButtonTextWidget(
                                              color: controller.diabetic.value == Strings.type1
                                                  ? AppColors.darkSelectedColor
                                                  : AppColors.kSecColorNotSelected,
                                              fontColor: controller.diabetic.value ==
                                                  Strings.type1
                                                  ? AppColors.white
                                                  : AppColors.kDarkGreenColorText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              title: Strings.type1Capital,
                                              borderRadius: 25,
                                              paddingHorizontal: 30,
                                              paddingVertical: 15,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 21,
                                        ),
                                        Theme(
                                          data: ThemeData(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                          ),
                                          child: InkWell(
                                            onTap: () => controller.changeDiabeticStatus(Strings.type2),
                                            child: SelectButtonTextWidget(
                                              color: controller.diabetic.value == Strings.type2
                                                  ? AppColors.darkSelectedColor
                                                  : AppColors.kSecColorNotSelected,
                                              fontColor: controller.diabetic.value ==
                                                  Strings.type2
                                                  ? AppColors.white
                                                  : AppColors.kDarkGreenColorText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              title: Strings.type2Capital,
                                              borderRadius: 25,
                                              paddingHorizontal: 30,
                                              paddingVertical: 15,
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
