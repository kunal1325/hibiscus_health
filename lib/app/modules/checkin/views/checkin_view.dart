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
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.kPrimaryColor,
              elevation: 0,
              toolbarHeight: 80,
              title: Text(
                Strings.checkin,
                style: Utils.kBigText.copyWith(fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
            ),
            body: ComingSoon(
              onClick: () {
                // pageController?.jumpToPage(0);
                controller.setReminderModal();
              },
              buttonTitle: "Set Check-In Time",
            ),
          );
        });
  }
}
