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
  var userId;

  var isLoading = false.obs;

  @override
  void onInit() {
    patient = Storage.getValue(Constants.patientName);
    userId = Storage.getValue(Constants.userId);
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

  oneUnansweredPost() {
    postAnswers();
    currentQuestionIndex.value += 2;
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
        //When answered 'A' for question 4 AND/OR 'B' for option 5
        if (currentQuestionIndex.value == 4 &&
            (answers[3] != options[3][0] && answers[4] != options[4][1])) {
          return oneUnansweredPost;
        } else {
          return normalQuestionNext;
        }
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
    _apiHelper.getDailyCheckInQuestions().futureValue((value) {
      checkInQuestions
          .addAll(CheckInResponse.fromJson(value).dailyCheckIns ?? []);
      addOptions();
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
          Storage.saveValue(Constants.lastTime, DateTime.now().toString());
          isLoading.value = false;
          delayedNavigation();
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
