import '../../../../import.dart';

class UpdatePasswordView extends GetView<ResetPasswordController> {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      init: ResetPasswordController(),
      builder: (controller) => Scaffold(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                Strings.updatePassword,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                Strings.updatePasswordDescription,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kPrimaryColorText,
                                ),
                              ),
                              SizedBox(
                                height: 23,
                              ),

                              Form(
                                autovalidateMode: AutovalidateMode.disabled,
                                key: controller.formKeyUpdatePassword,
                                child: Column(
                                  children: [
                                    TextInputField(
                                      fillColor: false,
                                      hintText: Strings.enterOtpHint,
                                      labelText: Strings.enterOtp,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      focusNode: controller.otpFocusNode,
                                      requestFocusNode: controller.newPasswordFocusNode,
                                      controller: controller.otpController,
                                      validator: controller.isValidOtp,
                                      obscureText: false,
                                      suffixIcon: SizedBox(),
                                      prefixIcon: SizedBox(),
                                    ),
                                    SizedBox(height: 18,),
                                    Obx(() =>
                                        TextInputField(
                                          fillColor: false,
                                          hintText: Strings.passwordHint,
                                          labelText: Strings.password,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          focusNode: controller.newPasswordFocusNode,
                                          requestFocusNode: controller.confirmNewPasswordFocusNode,
                                          controller: controller.newPasswordController,
                                          validator: controller.isValidNewPassword,
                                          obscureText: controller.isNewPasswordVisible.value,
                                          suffixIcon: Theme(
                                            data: ThemeData(
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                            ),
                                            child: IconButton(
                                                icon: Icon(controller.isNewPasswordVisible.value ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.kPrimaryColorText,),
                                                onPressed: () => controller.changeNewPasswordEyeIcon()
                                            ),
                                          ),
                                          prefixIcon: SizedBox(),
                                        ),
                                    ),
                                    SizedBox(height: 18,),
                                    Obx(() =>
                                        TextInputField(
                                          fillColor: false,
                                          hintText: Strings.confirmPasswordHint,
                                          labelText: Strings.confirmPassword,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          focusNode: controller.confirmNewPasswordFocusNode,
                                          controller: controller.confirmNewPasswordController,
                                          validator: controller.isValidConfirmNewPassword,
                                          obscureText: controller.isConfirmNewPasswordVisible.value,
                                          suffixIcon: Theme(
                                            data: ThemeData(
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                            ),
                                            child: IconButton(
                                                icon: Icon(controller.isConfirmNewPasswordVisible.value ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.kPrimaryColorText,),
                                                onPressed: () => controller.changeConfirmNewPasswordEyeIcon()
                                            ),
                                          ),
                                          prefixIcon: SizedBox(),
                                          onEditingComplete: (){
                                            // controller.checkConnectivity();
                                          },
                                        ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 35,
                              ),
                              InkWell(
                                  onTap: () {
                                    // controller.navigationAction("/signIn");
                                  },
                                  child: CustomButtons(
                                    weight: Get.width - 40,
                                    height: 50,
                                    color: AppColors.kSecColor,
                                    shadowColor: AppColors.kSecColor,
                                    borderRadius: 6,
                                    title: Strings.setNewPassword,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontColor: AppColors.kPrimaryColor,
                                    withShadow: false,
                                  )),
                            ],
                          ),
                        ),
                      )),
                  Positioned.fill(
                    top: Get.width / 4,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: DropShadow(
                        blurRadius: 0.2,
                        offset: const Offset(1, 1),
                        spread: 1,
                        color: AppColors.kPrimaryColor,
                        child: Utils.assetSVGImage(AppImages.logoWhite,
                            width: 141, height: 57),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 49,
                    left: 18,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  // Blur box
                ],
              )),
        ),
      ),
    );
  }
}
