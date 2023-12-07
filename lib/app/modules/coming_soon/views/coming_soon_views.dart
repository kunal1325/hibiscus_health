import 'package:hibiscus_health/import.dart';

class ComingSoonView extends GetView<ComingSoonController> {
  const ComingSoonView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComingSoonController>(
        init: ComingSoonController(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
                  body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Utils.assetImage(AppImages.comingSoonIcon, height: 100),
                const SizedBox(height: 20),
                Text(
                  Strings.comingSoon,
                  style: Utils.kHeadingTextStyle
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: CustomButtons(
                    weight: Get.width / 2,
                    height: 40,
                    color: AppColors.kSecColor,
                    shadowColor: AppColors.kSecColor,
                    borderRadius: 30,
                    title: Strings.returnHome,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.kPrimaryColor,
                    withShadow: false,
                  ),
                ),
              ],
            ),
          )));
        });
  }
}
