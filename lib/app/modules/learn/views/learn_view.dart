import '../../../../import.dart';

class LearnView extends GetView<LearnController> {
  LearnView({
    super.key,
    this.pageController,
  });
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearnController>(
      init: LearnController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.kPrimaryColor,
            elevation: 0,
            toolbarHeight: 80,
            title: Text(
              Strings.learn,
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
