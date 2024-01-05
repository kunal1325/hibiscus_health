import '../../../../import.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      init: ResetPasswordController(),
      builder: (controller) =>  ConnectivityCheckWidget(
          body: Scaffold(
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
                          child: Container(
                            width: Get.width,
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
                                    height: 30,
                                  ),

                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    Strings.resetPassword,
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
                                    Strings.resetPasswordDescription,
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
                                    key: controller.formKeyResetPassword,
                                    child: Column(
                                      children: [
                                        TextInputField(
                                          fillColor: false,
                                          maxLength: 30,
                                          hintText: Strings.emailHint,
                                          labelText: Strings.email,
                                          keyboardType: TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          focusNode: controller.emailFocusNode,
                                          controller: controller.emailController,
                                          validator: controller.isValidEmail,
                                          obscureText: false,
                                          suffixIcon: SizedBox(),
                                          prefixIcon: SizedBox(),
                                          onEditingComplete: () {
                                            controller.validateResetPasswordForm();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 35,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.validateResetPasswordForm();
                                      },
                                      child: CustomButtons(
                                        weight: Get.width - 40,
                                        height: 50,
                                        color: AppColors.kSecColor,
                                        shadowColor: AppColors.kSecColor,
                                        borderRadius: 6,
                                        title: Strings.sendResetCode,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontColor: AppColors.kPrimaryColor,
                                        withShadow: false,
                                      )),
                                  SizedBox(
                                    height: 35,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ), // Blur box
                      Obx(() =>
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: controller.isLoading.value,
                            child: Utils.getProgressBar(context),
                          )
                      ),
                    ],
                  )),
            ),
          ),
      )
    );
  }
}
