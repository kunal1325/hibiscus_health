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

  static assetImage(String imagePath, {Color? color, double? height, double? width}) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      color: color,
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

}
