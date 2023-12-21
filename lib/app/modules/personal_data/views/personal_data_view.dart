import '../../../../import.dart';

class PersonalDataView extends GetView<PersonalDataController> {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalDataController>(
      init: PersonalDataController(),
      builder: (controller) => ConnectivityCheckWidget(
          body: Scaffold(
            backgroundColor: AppColors.white,
            body: Center(
              child: Text(
                "Personal Data Screen",
                style: GoogleFonts.inter(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            )
          ),
      )
    );
  }
}

