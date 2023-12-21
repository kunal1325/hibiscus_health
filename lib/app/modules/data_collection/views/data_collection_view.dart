import '../../../../import.dart';


class DataCollectionView extends GetView<DataCollectionController> {
  const DataCollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataCollectionController>(
      init: DataCollectionController(),
      builder: (controller) => ConnectivityCheckWidget(
          body: PopScope(
            canPop:false,
            onPopInvoked: (didPop) {
              controller.onBackPressed();
              return;
            },
            child: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.white,
                body: Obx(() =>
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.processIndex.value != 0
                                  ? Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                                    onPressed: controller.onBackPressed,
                                  ),
                                ),
                              )
                                  : Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: IconButton(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                                        onPressed: null,
                                      ),
                                    ),
                                  ),
              
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                child: StepProgressIndicator(
                                  totalSteps: 3,
                                  currentStep: controller.processIndex.value + 1,
                                  selectedColor: AppColors.kSecColor,
                                  unselectedColor: AppColors.textFieldBorderColor,
                                  padding: 2,
                                  size: 3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
              
                              controller.processIndex.value == 0
                                  ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: PersonalDataView(),
                                  ))
                                  : SizedBox(),
                              controller.processIndex.value == 1
                                  ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: BioDataView(),
                                  ))
                                  : SizedBox(),
                              controller.processIndex.value == 2
                                  ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Obx(() => FaceScanDescriptionView(isScanFailed: controller.isScanFailed.value,),)
                                  ))
                                  : SizedBox(),
              
              
                              Center(
                                child: InkWell(
                                    onTap: () {
                                      controller.onNextPressed();
                                    },
                                    child: CustomButtons(
                                      weight: Get.width- 40,
                                      height: 50,
                                      color: AppColors.kSecColor,
                                      shadowColor: AppColors.kSecColor,
                                      borderRadius: 10,
                                      title: controller.ButtonText(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontColor: AppColors.kPrimaryColor,
                                      withShadow: false,
                                    )
                                ),
                              ),

                              SizedBox(height: 15,),
                            ],
                          ),
                        ),
                        Obx(() =>
                            Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: controller.isLoading.value,
                              child: Utils.getProgressBar(context),
                            )
                        ),
                      ],
                    ),
                )
              ),
            ),
          ),
      )
    );
  }
}

