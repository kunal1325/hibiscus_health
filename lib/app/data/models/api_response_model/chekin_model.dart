import 'package:hibiscus_health/import.dart';

class CheckInResponse {
  List<DailyCheckIns>? dailyCheckIns;

  CheckInResponse({this.dailyCheckIns});

  CheckInResponse.fromJson(Map<String, dynamic> json) {
    if (json['Daily Check-ins'] != null) {
      dailyCheckIns = <DailyCheckIns>[];
      json['Daily Check-ins'].forEach((v) {
        dailyCheckIns!.add(new DailyCheckIns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailyCheckIns != null) {
      data['Daily Check-ins'] =
          this.dailyCheckIns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailyCheckIns {
  String? model;
  int? pk;
  Fields? fields;

  DailyCheckIns({this.model, this.pk, this.fields});

  DailyCheckIns.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    return data;
  }
}

class Fields {
  int? parent;
  String? label;
  String? question;
  String? questionType;
  String? options;

  Fields(
      {this.parent,
      this.label,
      this.question,
      this.questionType,
      this.options});

  Fields.fromJson(Map<String, dynamic> json) {
    parent = json['parent'];
    label = json['label'];
    question = json['question'];
    questionType = json['question_type'];
    options = json['options'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent'] = this.parent;
    data['label'] = this.label;
    data['question'] = this.question;
    data['question_type'] = this.questionType;
    data['options'] = this.options;
    return data;
  }
}

// class CheckInResponse {
//   List<CheckInModel>? data;
//   Meta? meta;
//
//   CheckInResponse({this.data, this.meta});
//
//   CheckInResponse.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <CheckInModel>[];
//       json['data'].forEach((v) {
//         data!.add(CheckInModel.fromJson(v));
//       });
//     }
//     meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (meta != null) {
//       data['meta'] = meta!.toJson();
//     }
//     return data;
//   }
// }
//
// class CheckInModel {
//   String? id;
//   String? checkinCategory;
//   String? question;
//   List<String>? options;
//
//   CheckInModel({this.checkinCategory, this.question, this.options});
//
//   CheckInModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     checkinCategory = json['checkin_category'];
//     question = json['question'];
//     options = json['options'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['checkin_category'] = checkinCategory;
//     data['question'] = question;
//     data['options'] = options;
//     return data;
//   }
// }

var incomingQuestions = {
  "Daily Check-ins": [
    {
      "model": "hibiscusapp.questionchildmodel",
      "pk": 1,
      "fields": {
        "parent": 1,
        "label": "💪 Energy Levels",
        "question": "How would you rate your energy levels today?",
        "question_type": "multiple_choice",
        "options": "Very low|Low|Moderate|High|Very high"
      }
    },
    {
      "model": "hibiscusapp.questionchildmodel",
      "pk": 2,
      "fields": {
        "parent": 1,
        "label": "😊 Mood",
        "question": "How would you rate your overall mood today?",
        "question_type": "multiple_choice",
        "options": "Happy| Sad| Stressed| Calm| Anxious"
      }
    },
    {
      "model": "hibiscusapp.questionchildmodel",
      "pk": 3,
      "fields": {
        "parent": 1,
        "label": "😴 Sleep Quality",
        "question": "How would you rate your sleep quality last night?",
        "question_type": "multiple_choice",
        "options": "Extremely poor|Fairly poor|Average|Good|Excellent"
      }
    },
    {
      "model": "hibiscusapp.questionchildmodel",
      "pk": 4,
      "fields": {
        "parent": 1,
        "label": "🥪 Food",
        "question":
            "Have you experienced any emotional eating in the last 24 hours?",
        "question_type": "multiple_choice",
        "options": "Yes, several times|Yes, once or twice|No"
      }
    },
    {
      "model": "hibiscusapp.questionchildmodel",
      "pk": 5,
      "fields": {
        "parent": 1,
        "label": "🏃🏼‍♀️🏃🏼 Activity",
        "question":
            "In the last 24 hours, did you engage in any physical activity?",
        "question_type": "multiple_choice",
        "options": "Yes|No"
      }
    },
    {
      "model": "hibiscusapp.questionchildmodel",
      "pk": 6,
      "fields": {
        "parent": 1,
        "label": "😊 Mood",
        "question":
            "Over the last 2 weeks, have you been bothered by any of the following problems: little interest or pleasure in doing things, feeling down, depressed or hopeless, or poor appetite or overeating?",
        "question_type": "multiple_choice",
        "options": "I have been bothered by one or more.|None of the above."
      }
    }
  ]
};

var questions = {
  "data": [
    {
      "id": "75",
      "checkin_category": "💪 Energy level",
      "question": "How would you rate your energy levels today?",
      "options": ["Very low", "Low", "Moderate", "High", "Very high"],
    },
    {
      "id": "76",
      "checkin_category": "😊 Mood",
      "question": "How would you rate your overall mood today?",
      "options": ["Happy", "Sad", "Stressed", "Calm", "Anxious"],
    },
    {
      "id": "77",
      "checkin_category": "😊 Mood",
      "question":
          "Over the last 2 weeks, have you been bothered by any of the following problems: little interest or pleasure in doing things, feeling down, depressed or hopeless, or poor appetite or overeating?",
      "options": ["I have been bothered by one or more.", "None of the above."],
    },
    {
      "id": "78",
      "checkin_category": "😴 Sleep",
      "question": "How would you rate your sleep quality last night?",
      "options": [
        "Extremely poor",
        "Fairly poor",
        "Average",
        "Good",
        "Excellent"
      ],
    },
    {
      "id": "79",
      "checkin_category": "🥪 Food",
      "question":
          "Have you experienced any emotional eating in the last 24 hours?",
      "options": ["Yes, several times", "Yes, once or twice", "No"],
    },
    {
      "id": "80",
      "checkin_category": "🏃🏼‍♀️🏃🏼 Activity",
      "question":
          "In the last 24 hours, did you engage in any physical activity?",
      "options": ["Yes", "No"],
    },
  ],
  "meta": {
    "pagination": {"page": 1, "pageSize": 25, "pageCount": 1, "total": 6}
  }
};
