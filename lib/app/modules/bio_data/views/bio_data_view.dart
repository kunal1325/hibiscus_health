import '../../../../import.dart';

class BioDataView extends GetView<BioDataController> {
  const BioDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BioDataController>(
      init: BioDataController(),
      builder: (controller) => ConnectivityCheckWidget(
          body: Scaffold(
            backgroundColor: AppColors.white,
            body: Center(
              child: Text(
                "Bio Data Screen",
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

