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

}
