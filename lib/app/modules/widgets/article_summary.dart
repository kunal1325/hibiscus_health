
import '../../../import.dart';

class ArticleSummary extends StatelessWidget {
  const ArticleSummary({
    super.key,
    required this.articleTip,
  });

  final String articleTip;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kSummaryBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10),
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.kSecColor,
                child: Transform.rotate(
                  angle: 180* pi/180,
                  child:
                  const Icon(Icons.tungsten_outlined,color: AppColors.white,size: 20),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: Text(
                articleTip,
                maxLines: 40,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: AppColors.kPrimaryColorText,
                      height: 1.5
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
