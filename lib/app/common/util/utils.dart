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

  static assetSVGImage(String imagePath, {double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
    );
  }

  static assetImage(String imagePath, {Color? color, double? height, double? width, BoxFit? boxFit}) {
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
          bottom: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height/6.3),
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
          SizedBox(height: 14,),
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
            SizedBox(height: 20,),
            Text(
              Strings.WillOnlyTakeASecond,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        )
    );
  }

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
          alignment: Alignment.centerRight,
          child: InkWell(
              onTap: () {
                Get.back();
                onTap?.call();
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
      );



}
