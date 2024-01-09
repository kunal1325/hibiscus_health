import '../../../import.dart';

class SelectButtonTextWidget extends StatelessWidget {
  final double paddingVertical;
  final double paddingHorizontal;
  final Color color;
  final double borderRadius;
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;

  const SelectButtonTextWidget(
      {super.key,
        required this.paddingVertical,
        required this.paddingHorizontal,
        required this.color,
        required this.borderRadius,
        required this.title,
        required this.fontWeight,
        required this.fontSize,
        required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: paddingHorizontal),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
