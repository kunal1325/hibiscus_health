import '../../../import.dart';

class CustomButtons extends StatelessWidget {
  final double height;
  final double weight;
  final Color color;
  final Color shadowColor;
  final double borderRadius;
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;
  final bool withShadow;

  const CustomButtons(
      {super.key,
      required this.height,
      required this.weight,
      required this.color,
      required this.shadowColor,
      required this.borderRadius,
      required this.title,
      required this.fontWeight,
      required this.fontSize,
      required this.fontColor,
      required this.withShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: weight,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        boxShadow: [
          BoxShadow(color: shadowColor, spreadRadius: 3),
        ],
      ),
      child: Center(
        child: withShadow
            ? Text(
          title,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
            shadows: [
              const Shadow(
                color: AppColors.black, // Choose the color of the shadow
                blurRadius: 1.0, // Adjust the blur radius for the shadow effect
                offset: Offset(0.0,
                    0.2), // Set the horizontal and vertical offset for the shadow
              ),
            ],
          ),
        )
            : Text(
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
