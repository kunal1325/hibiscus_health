import '../../../../import.dart';

class CompleteProfileView extends GetView<SignUpController> {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.navigateBackFromCompleteProfile(),
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 94, left: 10),
                        child: Utils.assetImage(AppImages.icon, height: 55, width: 55),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: Text(
                          Strings.completeProfile,
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: Text(
                          Strings.completeProfileDescription,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kPrimaryColorText,
                          ),
                        ),
                      ),
                      SizedBox(height: 32,),

                      Form(
                        autovalidateMode: AutovalidateMode.disabled,
                        key: controller.formKeyCompleteProfile,
                        child: Column(
                          children: [
                            TextInputField(
                              enabled: false,
                              fillColor: true,
                              hintText: Strings.emailHint,
                              labelText: Strings.emailHint,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              focusNode: controller.emailFocusNode,
                              requestFocusNode: controller.passwordFocusNode,
                              controller: controller.emailController,
                              validator: controller.isValidEmail,
                              obscureText: false,
                              suffixIcon: SizedBox(),
                            ),
                            SizedBox(height: 12,),
                            TextInputField(
                              fillColor: false,
                              hintText: Strings.fNameHint,
                              labelText: Strings.fName,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              focusNode: controller.fNameFocusNode,
                              requestFocusNode: controller.lNameFocusNode,
                              controller: controller.fNameController,
                              validator: controller.isValidFName,
                              obscureText: false,
                              suffixIcon: SizedBox(),
                            ),
                            SizedBox(height: 12,),
                            TextInputField(
                              fillColor: false,
                              hintText: Strings.lNameHint,
                              labelText: Strings.lName,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              focusNode: controller.lNameFocusNode,
                              requestFocusNode: controller.phoneFocusNode,
                              controller: controller.lNameController,
                              validator: controller.isValidLName,
                              obscureText: false,
                              suffixIcon: SizedBox(),
                            ),
                            SizedBox(height: 12,),
                            TextInputField(
                              fillColor: false,
                              hintText: Strings.phoneNumberHint,
                              labelText: Strings.phoneNumber,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              focusNode: controller.phoneFocusNode,
                              requestFocusNode: controller.dobFocusNode,
                              controller: controller.phoneController,
                              validator: controller.isValidPhone,
                              obscureText: false,
                              suffixIcon: SizedBox(),
                            ),
                            SizedBox(height: 12,),
                            GestureDetector(
                              onTap: () => controller.selectDate(context),
                              child: AbsorbPointer(
                                child: TextInputField(
                                  fillColor: false,
                                  hintText: Strings.dobHint,
                                  labelText: Strings.dob,
                                  keyboardType: TextInputType.datetime,
                                  textInputAction: TextInputAction.next,
                                  focusNode: controller.dobFocusNode,
                                  requestFocusNode: controller.nutritionistFocusNode,
                                  controller: controller.dobController,
                                  validator: controller.isValidDob,
                                  obscureText: false,
                                  suffixIcon: SizedBox(),
                                ),
                              ),
                            ),
                            SizedBox(height: 34,),
                            Container(
                                width: 173,
                                height: 1,
                                decoration:     BoxDecoration(
                                    color: Color(0xffced2fb))
                            ),
                            SizedBox(height: 29,),
                            TextInputField(
                              fillColor: false,
                              hintText: Strings.nutritionistCodeHint,
                              labelText: Strings. nutritionistCode,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              focusNode: controller.nutritionistFocusNode,
                              controller: controller.nutritionistController,
                              validator: controller.isValidNutritionistCode,
                              obscureText: false,
                              suffixIcon: SizedBox(),
                            ),
                            SizedBox(height: 29,),
                          ],
                        ),
                      ),

                      SizedBox(height: 24,),
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: InkWell(
                            onTap: () {
                              // controller.checkConnectivity();
                            },
                            child: CustomButtons(
                              weight: Get.width- 40,
                              height: 50,
                              color: AppColors.kSecColor,
                              shadowColor: AppColors.kSecColor,
                              borderRadius: 10,
                              title: Strings.completeSignUp,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontColor: AppColors.kPrimaryColor,
                              withShadow: false,
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.trouble,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kPrimaryColorText,
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: InkWell(
                              onTap: controller.navigateToGetHelp,
                              child: Container(
                                width: 70,
                                height: 50,
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(
                                        Strings.getHelp,
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )


                    ],
                  ),
                ),
              ),
              Positioned(
                top: 49,
                left: 18,
                child: InkWell(
                  onTap: () {
                    controller.navigateBackFromCompleteProfile();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.kPrimaryColor,
                    size: 24,
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

