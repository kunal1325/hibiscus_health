import 'package:hibiscus_health/import.dart';

class InitialCheckinController extends GetxController {
  // final ApiHelper _apiHelper = Get.put<ApiHelper>(ApiHelperImpl());
  final ApiHelper _apiHelper = Get.find();
  List<CheckInModel> checkInQuestions =
      List<CheckInModel>.empty(growable: true).obs;

  List<List<String>> options = List<List<String>>.empty(growable: true).obs;

  List<String> answers = List<String>.empty(growable: true).obs;

  var currentQuestionIndex = 0.obs;
  var selectedOptionIndex = 100.obs;
  var patient;
  var userId;

  var isLoading = false.obs;

  @override
  void onInit() {
    patient = Storage.getValue(Constants.patientName);
    userId = Storage.getValue(Constants.userId);
    getQuestions();
    super.onInit();
  }

  void navigateToDailyCheckIn() {
    Get.offAll(() => DailyCheckinView());
  }

  delayedNavigation() async {
    await Future.delayed(Duration(seconds: 3));
    navigateToDailyCheckIn();
  }

  allAnsweredPost() {
    postAnswers();
    currentQuestionIndex.value++;
  }

  normalQuestionNext() {
    currentQuestionIndex.value++;
    selectedOptionIndex.value = 100;
  }

  void Function()? onNextClick() {
    //When no option has been selected
    if (selectedOptionIndex.value == 100) {
      return null;
    } else {
      if (currentQuestionIndex == checkInQuestions.length - 1) {
        return allAnsweredPost;
      } else {
        return normalQuestionNext;
      }
    }
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
    _apiHelper.getInitialCheckInQuestions().futureValue((value) {
      print("🐲🐲🐲🐲🐲");
      print(value);
      checkInQuestions
          .addAll(InitialCheckInResponse.fromJson(value).dailyCheckIns ?? []);
      addOptions();
      print("😍😍😍 ${checkInQuestions.length}");
      isLoading.value = false;
    }, onError: (error) {
      isLoading.value = false;
      if (kDebugMode) {
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

    isLoading.value = true;

    try {
      _apiHelper
          .postCheckInAnswers(AnsResponse(
              queModelId: checkInQuestions[0].fields?.parent.toString(),
              userId: userId.toString(),
              response: modelAnswers))
          .futureValue((value) {
        if (value["msg"] == "Successfully Done Thanks!." &&
            value["status"] == 200) {
          if (kDebugMode) {
            print(value["msg"]);
            print(value["status"]);
          }
          Storage.removeValue(Constants.lastTime);
          DateTime dt1 = DateTime.now();
          Storage.saveValue(Constants.lastTime, dt1.toString());
          isLoading.value = false;
          delayedNavigation();
        }
      }, onError: (error) {
        print("Initial checkin response error $error");
        isLoading.value = false;
      });
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}
