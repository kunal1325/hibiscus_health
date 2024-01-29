import '../../../../import.dart';

class CheckinController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;

  void scheduleNotification() async {
    String localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    String utcTimeZone =
        await AwesomeNotifications().getUtcTimeZoneIdentifier();

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: "daily_checkin_channel",
          title: 'Just in time!',
          body:
              'Schedule to shows at ${selectedTime.value.hour}:${selectedTime.value.minute}',
          payload: {'uuid': 'uuid-test'},
        ),

        ///SCHEDULING NOTIFICATION AT GIVEN DATE and/or TIME (CAN BE SET TO REPEAT)
        schedule: NotificationCalendar(
            // hour: selectedTime.value.hour, minute: selectedTime.value.minute, timeZone: localTimeZone, repeats: true));
            hour: selectedTime.value.hour,
            minute: selectedTime.value.minute,
            timeZone: localTimeZone,
            repeats: true));
    Get.back();
  }

  String currentMinute() {
    int currMin = selectedTime.value.minute;
    if (currMin < 10) return "0${currMin}";
    return currMin.toString();
  }

  String currentHour() {
    int currHour = selectedTime.value.hour;

    if (currHour == 0)
      return "12";
    else if (currHour < 10)
      return "0${currHour}";
    else if (currHour == 12)
      return "12";
    else if (currHour > 12 && currHour < 22) return "0${currHour - 12}";

    return "${currHour - 12}";
  }

  @override
  Future<void> onInit() async {
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
          channelGroupKey: "daily_checkin_group",
          channelKey: "daily_checkin_channel",
          channelName: "basic_notification",
          channelDescription: "Sending Daily checkin notification")
    ], channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: "daily_checkin_group",
        channelGroupName: "Daily Check-In Group",
      )
    ]);

    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);

    bool isAllowedToSendNotification =
        await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowedToSendNotification) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }

    super.onInit();
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      selectedTime.value = picked;
    }
  }

  void setReminderModal() {
    Get.bottomSheet(
      isScrollControlled: true,
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: Get.height * .65,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: Get.height * 0.05, child: Divider(thickness: 3)),
                const SizedBox(height: 25),
                Utils.assetImage(
                  AppImages.checkinTimeIcon,
                  height: 115,
                  width: 115,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width * 0.6,
                  child: Text(Strings.whatsCheckInTime,
                      textAlign: TextAlign.center,
                      style: Utils.kBigText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kPrimaryColor)),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Text(Strings.pickNotificationTime,
                      textAlign: TextAlign.center,
                      style: Utils.kParagraphTextStyle),
                ),
                const SizedBox(height: 25),
                InkWell(
                    onTap: () => pickTime(context),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${currentHour()}:${currentMinute()}",
                              textAlign: TextAlign.center,
                              style: Utils.kBigText.copyWith(
                                  color: AppColors.brickRed, fontSize: 60)),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "AM",
                                style: Utils.kParagraphTextStyle.copyWith(
                                  color: selectedTime.value.hour > 11
                                      ? AppColors.textFieldBorderColor
                                      : AppColors.kPrimaryColorText,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "PM",
                                style: Utils.kParagraphTextStyle.copyWith(
                                  color: selectedTime.value.hour > 11
                                      ? AppColors.kPrimaryColorText
                                      : AppColors.textFieldBorderColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                const SizedBox(height: 25),
                InkWell(
                  onTap: scheduleNotification,
                  child: CustomButtons(
                    weight: Get.width - 40,
                    height: 50,
                    color: AppColors.kSecColor,
                    shadowColor: AppColors.transparent,
                    borderRadius: 10,
                    title: Strings.setReminder,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.kPrimaryColor,
                    withShadow: false,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
