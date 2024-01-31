import '../../../../import.dart';

class SignUpController extends GetxController {

  ///Common variables
  var isLoading = false.obs;
  var errorMsg = Strings.emptyString.obs;

  ///Sign Up variables
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isPasswordVisible = true.obs;
  var isConfirmPasswordVisible = true.obs;
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();

  ///Complete Profile variables
  GlobalKey<FormState> formKeyCompleteProfile = GlobalKey<FormState>();
  final fNameFocusNode = FocusNode();
  final lNameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final dobFocusNode = FocusNode();
  final dietitianFocusNode = FocusNode();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final dietitianController = TextEditingController();
  DateTime? selectedDate;
  var selectedCountry = Country(
      iso3Code: Strings.USA,
      isoCode: Strings.US,
      name: Strings.UnitedStates,
      phoneCode: Strings.one_string).obs;
  TextEditingController ccController = TextEditingController(text: "+1");
  Region selectedRegion = Region(Strings.US, 1);
  List<Region> regions = [];
  final ApiHelper _apiHelper = Get.find();
  var store = Store(PhoneNumberUtil());

  ///Common Functions

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    regions = await store.getRegions();
    super.onInit();
  }

  void checkConnectivity() async {
    Utils.dismissKeyboard();
    try {
      final isValid = formKeyCompleteProfile.currentState!.validate();
      if (!isValid) return;
      formKeyCompleteProfile.currentState!.save();

      var isConnected =
      await Utils.checkInternetConnectivity();
      if (isConnected) {
        errorMsg.value = Strings.emptyString;
        isLoading.value = true;
        _apiHelper
            .register(RegisterRequest(
            email: emailController.text,
          first_name: fNameController.text,
          last_name: lNameController.text,
          phone_number: "${ccController.text} ${phoneController.text}",
          password: passwordController.text,
          password2: confirmPasswordController.text,
          user_role: "PATIENT",
          DOB: dobController.text,
          unique_code: dietitianController.text
        ))
            .futureValue((value) {
          var userResponse = UserModel.fromJson(value);
          if(userResponse.status == 200 && userResponse.msg == "Registration Success"){
            Storage.saveValue(Constants.accessToken, userResponse.token?.access);
            Storage.saveValue(Constants.refreshToken, userResponse.token?.refresh);
            Storage.saveValue(Constants.userId, userResponse.userID);
            Storage.saveValue(Constants.dietitianId, userResponse.dietitianID);
            Storage.saveValue(Constants.patientName, userResponse.patientName);
            Storage.saveValue(Constants.dietitianName, userResponse.dietitianName);
            Storage.saveValue(Constants.userEmail, userResponse.email);
            Storage.saveValue(Constants.age, userResponse.age.toString());
            navigateToStartMyJourney();
            isLoading.value = false;
          }else{
            Utils.showSnackBarFun(Get.context, userResponse.msg ?? "Something Went Wrong !!!");
            isLoading.value = false;
          }
        });

      } else {
          Utils.showSnackBarFun(Get.context, Strings.noConnection);
          isLoading.value = false;
      }
    } catch (e) {
      print("Error =================>>>>>>>>>>>>>>>>>");
      print(e);
      Utils.showSnackBarFun(Get.context, "Something Went Wrong!");
      isLoading.value = false;
    }
  }

  void saveDataToSession() {
    Utils.dismissKeyboard();
    try {
      var temp = formKeySignUp.currentState;
      if (temp != null && temp.validate()) {
        errorMsg.value = Strings.emptyString;
        navigateToPrivacyFirst();
      }
    } catch (e) {
      print("Error =================>>>>>>>>>>>>>>>>>");
      print(e);
    }
  }

  ///Sign Up functions
  void changePasswordEyeIcon () {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  void changeConfirmPasswordEyeIcon () {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
  String? isValidEmail(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyEmailError;
    } else if (!GetUtils.isEmail(text))
      return Strings.invalidEmailError;
    else
      return null;
  }
  String? isValidPassword(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyPasswordError;
    }
    final hasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    final hasNumber = text.contains(RegExp(r'[0-9]'));
    if (!hasLetter || !hasNumber) {
      return Strings.invalidPasswordError;
    }
    if (text.length < 8) {
      return Strings.shortPasswordError;
    }
    return null;
  }
  String? isValidConfirmPassword(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyConfirmPasswordError;
    }
    final ConfirmHasLetter = text.contains(RegExp(r'[a-zA-Z]'));
    final ConfirmHasNumber = text.contains(RegExp(r'[0-9]'));
    if (!ConfirmHasLetter || !ConfirmHasNumber) {
      return Strings.invalidConfirmPasswordError;
    }
    if (text != passwordController.text) {
      return Strings.passwordNotMatchedError;
    }
    if (text.length < 8) {
      return Strings.shortConfirmPasswordError;
    }
    return null;
  }


  ///Complete Profile functions
  String? isValidFName(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyFirstNameError;
    }
    else
      return null;
  }
  String? isValidLName(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyLastNameError;
    }
    else
      return null;
  }
  String? isValidPhone(String? text) {
    if (text!.isEmpty) {
      return Strings.shortPhoneNumberError;
    }
    if (text.length < 10) {
      return Strings.shortPhoneNumberError;
    }
    else
      return null;
  }
  String? isValidDob(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyDobNameError;
    }
    else
      return null;
  }
  String? isValidDietitianCode(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyDietitianCodeNameError;
    }
    if (text.length <= 7) {
      return Strings.shortDietitianCodeError;
    }
    else
      return null;
  }
  Future<void> selectDatePlatformWise(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
        return buildCupertinoDatePicker(context);
      default:
        return buildMaterialDatePicker(context);
    }
  }
  Future<void> buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1992, 01, 01),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Date Of Birth',
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dobController.text = '${picked.month}/${picked.day}/${picked.year}';
    }
    FocusScope.of(context).requestFocus(dietitianFocusNode);
  }
  Future<void> buildCupertinoDatePicker(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != selectedDate) {
                  selectedDate = picked;
                  dobController.text = '${picked.month}/${picked.day}/${picked.year}';
                }
                FocusScope.of(context).requestFocus(dietitianFocusNode);
              },
              initialDateTime: DateTime(1992, 01, 01),
              minimumYear: 1920,
              maximumYear: DateTime.now().year,
            ),
          );
        });
  }
  void openCountryPickerDialog() => showDialog(
    context: Get.context!,
    builder: (context) => Theme(
      data: Theme.of(context).copyWith(
        primaryColor: AppColors.kPrimaryColor,
        scaffoldBackgroundColor: Colors.black,
        dialogBackgroundColor: Colors.black,
      ),
      child: CountryPickerDialog(
        searchCursorColor: AppColors.kPrimaryColor,
        isSearchable: false,
        title: Text(Strings.SelectCountry),
        onValuePicked: (country) {
          selectedCountry.value = country;
          ccController.text = '+${country.phoneCode}';
          selectedRegion = regions
              .where((element) =>
          element.prefix.toString() == country.phoneCode)
              .first;
        },
        itemFilter: (country) {
          if (country.phoneCode == Strings.one_string ||
              country.phoneCode == Strings.nine_one_string) {
            return true;
          } else {
            return false;
          }
        },
        itemBuilder: ((country) {
          return Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              SizedBox(width: 8.0),
              Text("+${country.phoneCode}"),
              SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  country.name,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        }),
        priorityList: [
          CountryPickerUtils.getCountryByIsoCode(Strings.US),
        ],
      ),
    ),
  );


  ///Navigation from Sign Up
  void navigateToSignIn(){
     Get.offNamed(Routes.signIn);
  }
  void navigateToGetHelp(){
    Get.toNamed(Routes.helpUs);
  }
  void navigateToPrivacyFirst(){
    Get.toNamed(Routes.privacyFirst);
  }
  Future<void> openTermsOfService() async {
    if (await canLaunchUrlString(Constants.TERM_CONDITION_URL)) {
    await launchUrlString(Constants.TERM_CONDITION_URL);
    } else {
    Get.to(TermAndConditionPage());
    }
  }
  Future<void> openPrivacyPolicy() async {
    if (await canLaunchUrlString(Constants.PRIVACY_POLICIES_URL)) {
    await launchUrlString(Constants.PRIVACY_POLICIES_URL);
    } else {
    Get.to(PrivacyPoliciesPage());
    }
  }
  navigateBackFromSignUp(){
    Get.offNamedUntil(Routes.welcomeScreen, (route) => false);
  }
  navigateToStartMyJourney(){
    Get.toNamed(Routes.startMyJourney);
  }


}
