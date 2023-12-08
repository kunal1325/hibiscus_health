import 'package:hibiscus_health/import.dart';

class LibraryCard extends StatelessWidget {
  final String cardTitle;
  final String image;

  const LibraryCard({
    required this.cardTitle,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 175,
      decoration: BoxDecoration(
        color: image == "" || image != "null"
            ? AppColors.kGreyText
            : AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          image == "" || image != "null"
              ? const SizedBox()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Utils.assetSVGImage(
                      AppImages.hibiscusIcon,
                    ),
                  ),
                ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black.withOpacity(0.1),
                  AppColors.black.withOpacity(0.2),
                  AppColors.black.withOpacity(0.5),
                  AppColors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Text(
              cardTitle.length > 12
                  ? "${cardTitle.substring(0, 12)}..."
                  : cardTitle,
              style: Utils.kParagraphTextStyle.copyWith(
                  fontSize: 15,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
