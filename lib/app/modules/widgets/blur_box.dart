import '../../../import.dart';

class BlurBoxWidget extends StatelessWidget {

  final double? height;
  final Widget? child;
  const BlurBoxWidget({super.key, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: Container(
          width: Get.width,
          height: height,
          padding: EdgeInsets.only(top: 50, right: 25, left: 25, bottom: 25),
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
          child: Center(child: child),
        ),
      ),
    );
  }
}
