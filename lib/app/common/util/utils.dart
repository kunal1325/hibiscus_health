import '../../../import.dart';

abstract class Utils {
  static void showSnackBar(String? message) {
    closeSnackBar();

    Get.rawSnackbar(message: message).show();
  }

  static void closeSnackBar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static assetSVGImage(String imagePath,
      {double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
    );
  }

  static assetImage(String imagePath,
      {Color? color, double? height, double? width, BoxFit? boxFit}) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      color: color,
      fit: boxFit,
    );
  }

  static Future<bool> checkInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup(Strings.google);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (e) {
      print(e);
      return false;
    }
  }

  static dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
    SystemChannels.textInput.invokeMethod(Strings.textInput_hide);
  }

  static showSnackBarFun(context, String title) {
    SnackBar snackBar = SnackBar(
      content: Container(
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.red,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height / 6.3),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget getProgressBar2(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitSpinningLines(
            size: 60.0,
            color: AppColors.white,
            lineWidth: 2,
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            Strings.WillOnlyTakeASecond,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  static Widget getProgressBar(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height,
        color: AppColors.kPrimaryColor.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitRing(
              size: 35.0,
              color: AppColors.white,
              lineWidth: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              Strings.WillOnlyTakeASecond,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        ));
  }

  static TextStyle kBigText = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 19,
      color: AppColors.white,
    ),
  );

  static TextStyle kHeadingTextStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppColors.kPrimaryColor,
    ),
  );

  static TextStyle kParagraphTextStyle = GoogleFonts.inter(
    textStyle: const TextStyle(
        color: AppColors.kPrimaryColorText, height: 1.5, fontSize: 14),
  );

  static TextStyle kSmallText = GoogleFonts.inter(
    textStyle: const TextStyle(
        color: AppColors.kPrimaryColorText, height: 1.4, fontSize: 12),
  );

  static TextStyle kVerySmallText = GoogleFonts.inter(
    textStyle: const TextStyle(
      color: AppColors.kLightBlue,
      fontSize: 9,
    ),
  );

  static var kRoundTextFieldDecoration = InputDecoration(
    hintText: 'Enter',
    fillColor: AppColors.white.withOpacity(0.7),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );

  static bottomNavigationBar(var controller) => Container(
        color: AppColors.white,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: NavigationBar(
                backgroundColor: AppColors.kPrimaryColor,
                indicatorColor: AppColors.transparent,
                shadowColor: Colors.transparent,
                animationDuration: const Duration(seconds: 0),
                height: 90,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) {
                  controller.onSelectedIndexChanged(index);
                },
                destinations: [
                  NavigationDestination(
                    selectedIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.home,
                            height: 20, color: AppColors.kSecColor),
                        const SizedBox(height: 5),
                        const Text(
                          "Home",
                          style: TextStyle(color: AppColors.kSecColor),
                        )
                      ],
                    ),
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.home,
                            height: 20, color: AppColors.grey),
                        const SizedBox(height: 5),
                        const Text(
                          "Home",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.progress,
                            height: 20, color: AppColors.kSecColor),
                        const SizedBox(height: 5),
                        const Text(
                          "Progress",
                          style: TextStyle(color: AppColors.kSecColor),
                        )
                      ],
                    ),
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.progress,
                            height: 20, color: AppColors.grey),
                        const SizedBox(height: 5),
                        const Text(
                          "Progress",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.checkIn,
                            height: 20, color: AppColors.kSecColor),
                        const SizedBox(height: 5),
                        const Text(
                          "Check-in",
                          style: TextStyle(color: AppColors.kSecColor),
                        )
                      ],
                    ),
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.checkIn,
                            height: 20, color: AppColors.grey),
                        const SizedBox(height: 5),
                        const Text(
                          "Check-in",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.learn,
                            height: 20, color: AppColors.kSecColor),
                        const SizedBox(height: 5),
                        const Text(
                          "Learn",
                          style: TextStyle(color: AppColors.kSecColor),
                        )
                      ],
                    ),
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.learn,
                            height: 20, color: AppColors.grey),
                        const SizedBox(height: 5),
                        const Text(
                          "Learn",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.more,
                            height: 20, color: AppColors.kSecColor),
                        const SizedBox(height: 5),
                        const Text(
                          "More",
                          style: TextStyle(color: AppColors.kSecColor),
                        )
                      ],
                    ),
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        assetImage(AppImages.more,
                            height: 20, color: AppColors.grey),
                        const SizedBox(height: 5),
                        const Text(
                          "More",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  static void showDialog(
    String? message, {
    String title = Strings.error,
    bool success = false,
    VoidCallback? onTap,
  }) =>
      Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async {
          Get.back();

          onTap?.call();

          return true;
        },
        title: success ? Strings.success : title,
        content: Text(
          message ?? Strings.somethingWentWrong,
          textAlign: TextAlign.center,
          maxLines: 6,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.avgSecColor,
          ),
        ),
        confirm: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
                onTap: () {
                  Get.back();
                  onTap?.call();
                },
                child: CustomButtons(
                  weight: Get.width - 50,
                  height: 40,
                  color: AppColors.kSecColor,
                  shadowColor: AppColors.kSecColor,
                  borderRadius: 10,
                  title: Strings.ok,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.kPrimaryColor,
                  withShadow: false,
                )),
          ),
        ),
      );


}
