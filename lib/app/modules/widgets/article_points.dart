import '../../../import.dart';

class ArticlePoints extends StatelessWidget {
  const ArticlePoints({
    super.key,
    required this.width,
    required this.subheading,
    required this.content,
    this.extraSpaceForSubpoint = false,
  });

  final double width;
  final String subheading;
  final String content;
  final bool extraSpaceForSubpoint;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        extraSpaceForSubpoint ? const SizedBox(width: 15) : const SizedBox(),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                const SizedBox(height:5 ),
                content != "null" || subheading != "null"?
                Utils.assetSVGImage(AppImages.hibiscusFlower, height: 12)
                : const SizedBox(),
              ],
            )),
        const SizedBox(width: 5),
        Expanded(
          flex: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subheading != "null" ?
              Text(
                subheading,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Utils.kParagraphTextStyle
                    .copyWith(fontWeight: FontWeight.w600),
              )
              :const SizedBox(),

              content != "null" ?
              Text(
                content,
                maxLines: 40,
                overflow: TextOverflow.ellipsis,
                style: Utils.kParagraphTextStyle,
              )
                  : const SizedBox() ,
            ],
          ),
        ),
      ],
    );
  }
}
