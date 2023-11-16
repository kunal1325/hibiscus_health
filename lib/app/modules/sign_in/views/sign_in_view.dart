import '../../../../import.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.navigateBack(),
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
                        padding: const EdgeInsets.only(top: 120),
                        child: Utils.assetImage(AppImages.icon, height: 106, width: 106),
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: Text(
                          Strings.signInTitle,
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
                          Strings.signInDescription,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kPrimaryColorText,
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),

                      Form(
                        autovalidateMode: AutovalidateMode.disabled,
                        key: controller.formKeySignIn,
                        child: Column(
                          children: [
                            TextInputField(
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
                            ),
                            SizedBox(height: 30,),
                            Obx(() =>
                                TextInputField(
                                  hintText: Strings.passwordHint,
                                  labelText: Strings.password,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  focusNode: controller.passwordFocusNode,
                                  controller: controller.passwordController,
                                  validator: controller.isValidPassword,
                                  obscureText: controller.isPinInVisible.value,
                                  suffixIcon: IconButton(
                                      icon: Icon(controller.isPinInVisible.value ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.kPrimaryColorText,),
                                      onPressed: () => controller.changeVisibility()
                                  ),
                                  onEditingComplete: (){
                                    controller.checkConnectivity();
                                  },
                                ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Theme(
                              data: ThemeData(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              child: InkWell(
                                onTap: controller.navigateToForgotPassword,
                                child: Container(
                                  height: 50,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          Strings.forgotPassword,
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.kPrimaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                              title: Strings.login,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.kPrimaryColor,
                              withShadow: false,
                            )
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Positioned(
                top: 49,
                left: 18,
                child: GestureDetector(
                  onTap: () {
                    onWillPop: () => controller.navigateBack();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.kPrimaryColor,
                    size: 24,
                  ),
                ),
              ),
              Positioned(
                bottom: 29,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.areYouANewUser,
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
                        onTap: controller.navigateToSignUp,
                        child: Container(
                          width: 70,
                          height: 50,
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  Strings.signUp,
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

