import '../../../../import.dart';

class HelpUsView extends GetView<HelpUsController> {
  const HelpUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpUsController>(
      init: HelpUsController(),
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
                      padding: const EdgeInsets.only(top: 60),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.kPrimaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                    Utils.assetImage(AppImages.help_us, height: 106, width: 151),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        Strings.helpPage,
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
                        Strings.helpPageDescription,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kPrimaryColorText,
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),

                    Form(
                      autovalidateMode: AutovalidateMode.disabled,
                      key: controller.formKeyHelpUs,
                      child: Column(
                        children: [
                          TextInputField(
                            fillColor: false,
                            hintText: Strings.fullNameHint,
                            labelText: Strings.fullName,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            focusNode: controller.fullNameFocusNode,
                            requestFocusNode: controller.emailFocusNode,
                            controller: controller.fullNameController,
                            validator: controller.isValidFullName,
                            obscureText: false,
                            suffixIcon: SizedBox(),
                            prefixIcon: SizedBox(),
                          ),
                          SizedBox(height: 18,),
                          TextInputField(
                            fillColor: false,
                            hintText: Strings.emailHint,
                            labelText: Strings.email,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: controller.emailFocusNode,
                            requestFocusNode: controller.phoneFocusNode,
                            controller: controller.emailController,
                            validator: controller.isValidEmail,
                            obscureText: false,
                            suffixIcon: SizedBox(),
                            prefixIcon: SizedBox(),
                          ),
                          SizedBox(height: 18,),
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
                            controller: controller.phoneController,
                            validator: controller.isValidPhone,
                          ),
                          SizedBox(height: 18,),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: AppColors.textFieldBorderColor,
                                  width: 1.0,
                                )
                            ),
                            child: Obx(() =>
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    items: controller.dropdownValues
                                        .map((value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                        .toList(),
                                    onChanged: ( value) {
                                      if(value != null){
                                        controller.dropdownValue.value = value;
                                      }
                                      else{
                                        controller.dropdownValue.value = controller.dropdownValues.first;
                                      }
                                    },
                                    isExpanded: false,
                                    value: controller.dropdownValue.value,
                                  ),
                                ),
                            )
                          ),
                          SizedBox(height: 18,),
                          TextFormField(
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            focusNode: controller.msgFocusNode,
                            controller: controller.msgController,//or null
                            decoration: InputDecoration(
                              hintText: Strings.messageHint,
                              labelText: Strings.message,
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.only(
                                top: 20.0,
                                bottom: 12.0,
                                left: 14.0,
                                right: 14.0,
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
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 21,),
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
                            title: Strings.next,
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

          ],
        ),
      ),
    );
  }
}

