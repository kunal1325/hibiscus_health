import '../../../../import.dart';

class CompleteProfileView extends GetView<SignUpController> {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.navigateBackFromSignUp(),
        child: Scaffold(
          backgroundColor: AppColors.white,
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
                              labelText: Strings.emptyString,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              focusNode: controller.emailFocusNode,
                              requestFocusNode: controller.passwordFocusNode,
                              controller: controller.emailController,
                              obscureText: false,
                              suffixIcon: SizedBox(),
                              prefixIcon: SizedBox(),
                            ), //Email
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
                              prefixIcon: SizedBox(),
                            ), //FName
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
                              prefixIcon: SizedBox(),
                            ), //LName
                            SizedBox(height: 12,),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: Strings.phoneNumberHint,
                                labelText: Strings.phoneNumber,
                                contentPadding: EdgeInsets.only(
                                  top: 14.0,
                                  bottom: 12.0,
                                  left: 14.0,
                                  right: 14.0,
                                ),
                                prefixIcon: GestureDetector(
                                    onTap: () {
                                      controller.openCountryPickerDialog();
                                    },
                                    child: Obx(() => Container(
                                      height: 23,
                                      width: 60,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            child: Container(
                                                height: 13,
                                                width: 20,
                                                child: CountryPickerUtils.getDefaultFlagImage(
                                                    controller.selectedCountry.value)
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down_rounded,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ))
                                ),
                                suffixIcon: SizedBox(),
                                errorStyle: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                                labelStyle: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kSecColorText,
                                ),
                                hintStyle: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.kSecColorText,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: AppColors.textFieldBorderColor,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: AppColors.textFieldBorderColor,
                                    width: 1.0,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                    width: 1.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: AppColors.kPrimaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              focusNode: controller.phoneFocusNode,
                              onFieldSubmitted: (_) {
                                Utils.dismissKeyboard();
                                controller.selectDate(context);
                              },
                              controller: controller.phoneController,
                              validator: controller.isValidPhone,
                            ), //Phone Number
                            SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => controller.selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: Strings.dobHint,
                                    labelText: Strings.dob,
                                    contentPadding: EdgeInsets.only(
                                      top: 14.0,
                                      bottom: 12.0,
                                      left: 14.0,
                                      right: 14.0,
                                    ),
                                    prefixIcon: Icon(Icons.calendar_month_outlined, size: 20,),
                                    suffixIcon: SizedBox(),
                                    errorStyle: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    ),
                                    labelStyle: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.kSecColorText,
                                    ),
                                    hintStyle: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.kSecColorText,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: AppColors.textFieldBorderColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: AppColors.textFieldBorderColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade200,
                                        width: 1.0,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: AppColors.kPrimaryColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  controller: controller.dobController,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(controller.dietitianFocusNode,);
                                  },
                                  validator: controller.isValidDob,
                                ),
                              ),
                            ), //Dob
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
                              hintText: Strings.dietitianCodeHint,
                              labelText: Strings. dietitianCode,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              focusNode: controller.dietitianFocusNode,
                              controller: controller.dietitianController,
                              validator: controller.isValidDietitianCode,
                              obscureText: false,
                              suffixIcon: SizedBox(),
                              prefixIcon: SizedBox(),
                              onEditingComplete: (){
                                controller.checkConnectivity();
                              },
                            ), //Nutritionist Code
                            SizedBox(height: 29,),
                          ],
                        ),
                      ),

                      SizedBox(height: 24,),
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
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
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
          ),
        ),
      ),
    );
  }
}

