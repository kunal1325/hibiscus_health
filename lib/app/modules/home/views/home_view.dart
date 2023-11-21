import '../../../../import.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      Strings.pushedMsg,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black
                      ),
                    ),
                    Obx(() => Text(
                          '${controller.counter.value}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black
                          ),
                        )),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: controller.incrementCounter,
                backgroundColor: AppColors.kSecColor,
                tooltip: Strings.increment,
                child: const Icon(Icons.add, color: AppColors.black,),
              ),
            ),
          );
        });
  }
}
