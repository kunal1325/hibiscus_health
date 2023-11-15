import 'dart:ffi';

import '../../../../import.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) => Scaffold(
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

                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        contentPadding: EdgeInsets.all(15.0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusNode: controller.emailFocusNode,
                      controller: controller.emailController,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(controller.emailFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        final validEmailPattern =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
                        if (!validEmailPattern.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: controller.isPinInVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        contentPadding: const EdgeInsets.all(15.0),
                        suffixIcon: IconButton(
                          icon: Icon(controller.secretPinVisibility),
                          onPressed: () {
                            controller.changeVisibility();
                          },
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      focusNode: controller.pinFocusNode,
                      controller: controller.pinController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }

                        final hasLetter = value.contains(RegExp(r'[a-zA-Z]'));
                        final hasNumber = value.contains(RegExp(r'[0-9]'));
                        if (!hasLetter || !hasNumber) {
                          return 'Password must contain both letters and numbers';
                        }

                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Text(
                            Strings.forgotPassword,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kPrimaryColor,
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
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.kPrimaryColor,
                  size: 24,
                ),
              ),
            ),
            Positioned(
              bottom: 59,
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
                  GestureDetector(
                    onTap: () {

                    },
                    child: Text(
                      Strings.signUp,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

