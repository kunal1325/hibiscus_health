import '../../../import.dart';


class OfflineScreen extends StatelessWidget {
  OfflineScreen({super.key});

  final isLoading = false.obs;
  final isConnected = false.obs;

  final List<OfflineInstructionModel> offlineInstructionModel = [
    OfflineInstructionModel(Strings.offlineInstructionTitleOne, Strings.offlineInstructionDescriptionOne),
    OfflineInstructionModel(Strings.offlineInstructionTitleTwo, Strings.offlineInstructionDescriptionTwo),
    OfflineInstructionModel(Strings.offlineInstructionTitleThree, Strings.offlineInstructionDescriptionThree),
    OfflineInstructionModel(Strings.offlineInstructionTitleFour, Strings.offlineInstructionDescriptionFour),
  ];

  void getConnection() async {
    isLoading.value = true;
    StreamController<DataConnectionStatus>
    connectivityStreamController =
    StreamController<DataConnectionStatus>();
    bool status = await DataConnectivityService()
        .checkInternetConnectivity();
    if (status) {
      connectivityStreamController
          .add(DataConnectionStatus.connected);
      isConnected.value = true;
    }
    loadData();
  }

  setLoaderOff(){
    isConnected.value ? null : Utils.showSnackBarFun(Get.context, "${Strings.stillNoConnection}");
    isLoading.value = false;
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 15), setLoaderOff);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.width/2.5,),
            Utils.assetImage(AppImages.offline, height: 188, width: 228),
            SizedBox(height: 40,),
            Text(
              Strings.offlineTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryColor,
              )
            ),
            SizedBox(height: 5,),
            Text(
              Strings.offlineDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColorText,
              ),
            ),
            SizedBox(height: 52,),
            Column(
              children: List.generate(
                offlineInstructionModel.length,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index+1}.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColorText,
                            letterSpacing: 0.40,
                            height: 1.2
                        ),
                      ),
                      SizedBox(width: 3,),
                      Text(
                        offlineInstructionModel[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryColorText,
                            letterSpacing: 0.40,
                            height: 1.2
                        ),
                      ),
                      Expanded(
                        child: Text(
                          offlineInstructionModel[index].description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kPrimaryColorText,
                              letterSpacing: 0.40,
                              height: 1.2
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.width/3.5,),
            Obx(() =>
                !isLoading.value
                    ? InkWell(
                      onTap: () {
                        getConnection();
                      },
                        child: CustomButtons(
                        weight: Get.width- 40,
                        height: 50,
                        color: AppColors.kSecColor,
                        shadowColor: AppColors.kSecColor,
                        borderRadius: 10,
                        title: Strings.retry,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.kPrimaryColor,
                        withShadow: false,
                      )
                  )
                    : CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      AppColors.kPrimaryColor),
                ),
            ),

            SizedBox(height: 52,),
          ],
        ),
      ),
    );
  }
}
