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
  final nutritionistFocusNode = FocusNode();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final nutritionistController = TextEditingController();
  DateTime? selectedDate;
  var selectedCountry = Country(
      iso3Code: Strings.USA,
      isoCode: Strings.US,
      name: Strings.UnitedStates,
      phoneCode: Strings.one_string).obs;
  TextEditingController ccController = TextEditingController(text: "+1");
  Region selectedRegion = Region(Strings.US, 1);
  List<Region> regions = [];
  var store = Store(PhoneNumberUtil());

  ///Common Functions

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    regions = await store.getRegions();
    super.onInit();
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
  void checkConnectivity() async {
    isLoading.value = true;
    navigateToPrivacyFirst();
    return;
    Utils.dismissKeyboard();
    try {
      var temp = formKeySignUp.currentState;
      if (temp != null && temp.validate()) {
        var isConnected =
        await Utils.checkInternetConnectivity();
        if (isConnected) {
          errorMsg.value = Strings.emptyString;
          print("data =================>>>>>>>>>>>>>>>>>");
          print("email ====================>>>>>>>>>>>>>>>>> ${emailController.text}");
          print("password ====================>>>>>>>>>>>>>>>>> ${passwordController.text}");
          print("confirm password ====================>>>>>>>>>>>>>>>>> ${confirmPasswordController.text}");
          navigateToPrivacyFirst();
        } else {
          errorMsg.value = Strings.noConnection;
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
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
      return Strings.emptyPhoneNumberError;
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
  String? isValidNutritionistCode(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyNutritionistCodeNameError;
    }
    else
      return null;
  }
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        dobController.text = '${picked.month} / ${picked.day} / ${picked.year}';
    }
    FocusScope.of(context).requestFocus(nutritionistFocusNode);
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
    Get.off(SignInView());
  }
  void navigateToGetHelp(){
    Get.toNamed("/helpUs");
  }
  void navigateToPrivacyFirst(){
    Get.toNamed("/privacyFirst");
  }
  void openTermsOfService(){

  }
  void openPrivacyPolicy(){

  }
  navigateBackFromSignUp(){
    Get.offNamedUntil("/welcomeScreen", (route) => false);
  }
  navigateBackFromCompleteProfile(){
    Get.offNamedUntil("/signUp", (route) => false);
  }

  navigateToStartMyJourney(){
    Get.off(StartMyJourneyView());
  }


}
