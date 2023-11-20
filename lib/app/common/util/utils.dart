import '../../../import.dart';

abstract class Utils {

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
        height: 105,
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
          bottom: MediaQuery.of(context).size.height - 225,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
