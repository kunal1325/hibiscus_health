import '../../../../import.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.kPrimaryColor,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      Strings.pushedMsg,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white
                      ),
                    ),
                    Obx(() => Text(
                          '${controller.counter.value}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white
                          ),
                        )),
                  ],
                ),
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: controller.incrementCounter,
                    backgroundColor: AppColors.kSecColor,
                    tooltip: Strings.increment,
                    child: const Icon(Icons.add, color: AppColors.black,),
                  ),
                  const SizedBox(height: 10,),
                  FloatingActionButton(
                    onPressed: controller.decrementCounter,
                    backgroundColor: AppColors.kSecColor,
                    tooltip: Strings.decrement,
                    child: const Icon(Icons.remove, color: AppColors.black,),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
