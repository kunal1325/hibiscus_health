import '../../../import.dart';

Widget iosBackButton = IconButton(
  icon: const Icon(Icons.arrow_back_ios, color: AppColors.white,size: 20),
  onPressed: ()=> Get.back(),
);