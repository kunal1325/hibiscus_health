import '../../../../import.dart';

class CheckinView extends GetView<CheckinController> {
  CheckinView({
    super.key,
    this.pageController,
  });
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckinController>(
        init: CheckinController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.kPrimaryColor,
                elevation: 0,
                toolbarHeight: 80,
                title: const Text(Strings.checkin),
                centerTitle: true,
              ),
              body: ComingSoon(
                onClick: () {
                  pageController?.jumpToPage(0);
                },
              ),
            ),
          );
        });
  }
}
