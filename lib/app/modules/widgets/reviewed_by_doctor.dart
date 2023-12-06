import 'package:hibiscus_health/import.dart';

class ReviewedByDoctor extends StatelessWidget {
  const ReviewedByDoctor({
    super.key,
    this.isReviewedByPresent = true,
    required this.doctorImage,
    required this.doctorName,
    required this.doctorQualification,
    this.qualificationWidth = 300,
    this.fontColor = AppColors.kLightBlue,
  });

  final bool isReviewedByPresent;
  final String doctorImage;
  final String doctorName;
  final String doctorQualification;
  final double qualificationWidth;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              doctorImage != "null" || doctorImage != ""
                  ? CircleAvatar(
                      radius: 20, backgroundImage: NetworkImage(doctorImage))
                  : CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.transparent,
                      child: Utils.assetSVGImage(AppImages.hibiscusIcon),
                    ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Utils.assetSVGImage(AppImages.greenVerified),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isReviewedByPresent
                  ? Text(
                      Strings.reviewedBy,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: AppColors.kGreyText,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : const SizedBox(),
              doctorName != "null" || doctorName != ""
                  ? Text(
                      doctorName,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: fontColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : const SizedBox(),
              doctorQualification != "null" || doctorQualification != ""
                  ? Text(
                      doctorQualification,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: fontColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
