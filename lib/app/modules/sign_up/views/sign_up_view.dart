import '../../../../import.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.navigateBackFromSignUp(),
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
                        padding: const EdgeInsets.only(top: 100),
                        child: Utils.assetImage(AppImages.icon, height: 90, width: 90),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: Text(
                          Strings.signUpTitle,
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
                          Strings.signUpDescription,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColorText,
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),

                      Form(
                        autovalidateMode: AutovalidateMode.disabled,
                        key: controller.formKeySignUp,
                        child: Column(
                          children: [
                            TextInputField(
                              fillColor: false,
                              hintText: Strings.emailHint,
                              labelText: Strings.email,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              focusNode: controller.emailFocusNode,
                              requestFocusNode: controller.passwordFocusNode,
                              controller: controller.emailController,
                              validator: controller.isValidEmail,
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
                                  focusNode: controller.passwordFocusNode,
                                  requestFocusNode: controller.confirmPasswordFocusNode,
                                  controller: controller.passwordController,
                                  validator: controller.isValidPassword,
                                  obscureText: controller.isPasswordVisible.value,
                                  suffixIcon: Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: IconButton(
                                        icon: Icon(controller.isPasswordVisible.value ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.kPrimaryColorText,),
                                        onPressed: () => controller.changePasswordEyeIcon()
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
                                  focusNode: controller.confirmPasswordFocusNode,
                                  controller: controller.confirmPasswordController,
                                  validator: controller.isValidConfirmPassword,
                                  obscureText: controller.isConfirmPasswordVisible.value,
                                  suffixIcon: Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: IconButton(
                                        icon: Icon(controller.isConfirmPasswordVisible.value ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.kPrimaryColorText,),
                                        onPressed: () => controller.changeConfirmPasswordEyeIcon()
                                    ),
                                  ),
                                  prefixIcon: SizedBox(),
                                  onEditingComplete: (){
                                    // FocusManager.instance.primaryFocus?.unfocus();
                                    controller.checkConnectivity();
                                  },
                                ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 22,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.iAgree,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kSecColorText,
                            ),
                          ),
                          SizedBox(height: 2,),
                          Row(
                            children: [
                              Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                child: InkWell(
                                  onTap: controller.openTermsOfService,
                                  child: Text(
                                    Strings.termsOfService,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.kSecColorText,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                Strings.and,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kSecColorText,
                                ),
                              ),
                              Expanded(
                                child: Theme(
                                  data: ThemeData(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                  ),
                                  child: InkWell(
                                    onTap: controller.openPrivacyPolicy,
                                    child: Text(
                                      Strings.privacyPolicy,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kSecColorText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 34,),
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: InkWell(
                            onTap: () {
                              controller.checkConnectivity();
                            },
                            child: CustomButtons(
                              weight: Get.width- 40,
                              height: 50,
                              color: AppColors.kSecColor,
                              shadowColor: AppColors.kSecColor,
                              borderRadius: 10,
                              title: Strings.signUp,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontColor: AppColors.kPrimaryColor,
                              withShadow: false,
                            )
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.alreadyAUser,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kPrimaryColorText,
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: InkWell(
                              onTap: controller.navigateToSignIn,
                              child: Text(
                                Strings.signIn,
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.trouble,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
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
                                        textAlign: TextAlign.center,
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
                      ),
                      SizedBox(
                        height: 35,
                      ),

                    ],
                  ),
                ),
              ),
              Positioned(
                top: 49,
                left: 18,
                child: InkWell(
                  onTap: () {
                    controller.navigateBackFromSignUp();
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

