import '../../../import.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
    required this.onClick,
    this.buttonTitle = Strings.returnHome,
  });

  final void Function() onClick;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.kPrimaryColor,
        height: Get.height,
        width: Get.width,
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.kBgColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
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
                onTap: onClick,
                child: CustomButtons(
                  weight: Get.width / 2,
                  height: 40,
                  color: AppColors.kSecColor,
                  shadowColor: AppColors.kSecColor,
                  borderRadius: 30,
                  title: buttonTitle ?? "",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.kPrimaryColor,
                  withShadow: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
