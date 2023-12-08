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
              title: const Text(Strings.more),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.logout,
                      size: 25, color: AppColors.white),
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
