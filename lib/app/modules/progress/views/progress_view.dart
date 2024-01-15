import '../../../../import.dart';

class ProgressView extends GetView<ProgressController> {
  ProgressView({
    super.key,
    this.pageController,
  });
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgressController>(
      init: ProgressController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.kPrimaryColor,
            elevation: 0,
            toolbarHeight: 80,
            title: Text(
              Strings.progress,
              style: Utils.kBigText.copyWith(fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: ComingSoon(
            onClick: () {
              pageController?.jumpToPage(0);
            },
          ),
        );
      },
    );
  }
}
