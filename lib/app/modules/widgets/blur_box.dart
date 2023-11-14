import '../../../import.dart';

class BlurBoxWidget extends StatelessWidget {

  final double height;
  const BlurBoxWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: Container(
          width: Get.width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xff424242).withOpacity(.4),
                const Color(0xff0F172A).withOpacity(.7),
                const Color(0xff000000).withOpacity(.9)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}
