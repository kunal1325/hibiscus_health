import 'package:hibiscus_health/import.dart';

class DailyCheckinController extends GetxController {
  final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());

  List<DailyCheckIns> checkInQuestions =
      List<DailyCheckIns>.empty(growable: true).obs;

  List<List<String>> options = List<List<String>>.empty(growable: true).obs;

  List<String> answers = List<String>.empty(growable: true).obs;

  static const pageSize = 20;
  var currentQuestionIndex = 0.obs;
  var selectedOptionIndex = 100.obs;
  var patient;

  var isLoading = false.obs;

  @override
  void onInit() {
    getQuestions();
    super.onInit();
  }

  void navigateToContentLibrary() {
    Get.offAll(() => LandingScreen());
  }

  delayedNavigation() async {
    await Future.delayed(Duration(seconds: 3));
    navigateToContentLibrary();
  }

  void addOptions() {
    checkInQuestions.forEach((element) {
      if (element.fields != null ||
          element.fields!.options != null ||
          element.fields!.options!.isNotEmpty)
        options.add(element.fields!.options!.split('|'));
    });
  }

  Future<void> getQuestions() async {
    isLoading.value = true;
    _apiHelper.getDailyCheckInQuestions().futureValue((value) {
      checkInQuestions
          .addAll(CheckInResponse.fromJson(value).dailyCheckIns ?? []);
      addOptions();
      isLoading.value = false;
    }, onError: (error) {
      if (kDebugMode) {
        isLoading.value = false;
        print("Get Questions $error");
      }
    });
  }

  void postAnswers() async {
    List<AnsModel> modelAnswers = [];

    for (int i = 0; i < answers.length; i++) {
      modelAnswers.add(
          AnsModel(pk: checkInQuestions[i].pk.toString(), answer: answers[i]));
    }

    if (Storage.hasData(Constants.patientName)) {
      patient = Storage.getValue(Constants.patientName);
    }

    var userId;
    if (Storage.hasData(Constants.userId)) {
      userId = Storage.getValue(Constants.userId);
    }

    var ansRes = AnsResponse(
        queModelId: checkInQuestions[0].fields?.parent.toString(),
        userId: userId.toString(),
        response: modelAnswers);

    isLoading.value = true;

    try {
      _apiHelper.postCheckInAnswers(ansRes).futureValue((value) {
        if (value["msg"] == "Successfully Done Thanks!." &&
            value["status"] == 200) {
          if (kDebugMode) {
            print(value["msg"]);
            print(value["status"]);
          }
          isLoading.value = false;
        }
      }, onError: (error) {
        print("Daily checkin response error $error");
        isLoading.value = false;
      });
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}
