import '../../../../import.dart';

class MoreView extends GetView<MoreController> {
  MoreView({
    super.key,
    this.pageController,
  });
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoreController>(
      init: MoreController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.kPrimaryColor,
              elevation: 0,
              toolbarHeight: 80,
              title: Text(
                Strings.more,
                style: Utils.kBigText.copyWith(fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
              actions: [
                Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: IconButton(
                    onPressed: () => controller.navigateToWelcomeScreen(),
                    icon: const Icon(Icons.logout,
                        size: 25, color: AppColors.white),
                  ),
                )
              ],
            ),
            body: ComingSoon(
              onClick: () {
                pageController?.jumpToPage(0);
              },
            ),
          ),
        );
      },
    );
  }
}
