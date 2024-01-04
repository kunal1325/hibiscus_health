class AnsResponse {
  String? queModelId;
  String? userId;
  List<AnsModel>? response;

  AnsResponse({this.queModelId, this.userId, this.response});

  AnsResponse.fromJson(Map<String, dynamic> json) {
    queModelId = json['que_model_id'];
    userId = json['user_id'];
    if (json['response'] != null) {
      response = <AnsModel>[];
      json['response'].forEach((v) {
        response!.add(new AnsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['que_model_id'] = this.queModelId;
    data['user_id'] = this.userId;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnsModel {
  String? pk;
  String? answer;

  AnsModel({this.pk, this.answer});

  AnsModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['answer'] = this.answer;
    return data;
  }
}

var newRes = {
  "que_model_id": "2",
  "user_id": "1",
  "response": [
    {"pk": "7", "answer": "Very high"},
    {"pk": "8", "answer": "Calm"},
    {"pk": "9", "answer": "None of the above"},
    {"pk": "10", "answer": "No"},
    {"pk": "11", "answer": "Yes"},
    {"pk": "12", "answer": "None of the above."}
  ]
};

// class AnswerResponse {
//   String? uid;
//   List<AnswerModel>? response;
//
//   AnswerResponse({this.uid, this.response});
//
//   AnswerResponse.fromJson(Map<String, dynamic> json) {
//     uid = json['uid'];
//     if (json['response'] != null) {
//       response = <AnswerModel>[];
//       json['response'].forEach((v) {
//         response!.add(AnswerModel.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['uid'] = uid;
//     if (response != null) {
//       data['response'] = response!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class AnswerModel {
//   String? pk;
//   String? answer;
//
//   AnswerModel({this.pk, this.answer});
//
//   AnswerModel.fromJson(Map<String, dynamic> json) {
//     pk = json['qid'];
//     answer = json['answer'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['qid'] = pk;
//     data['answer'] = answer;
//     return data;
//   }
// }
//
// var response = {
//   "uid": "bjds398y3884b",
//   "response": [
//     {"qid": "75", "answer": "High"},
//     {"qid": "76", "answer": "Calm"},
//     {"qid": "77", "answer": "None of the above"},
//     {"qid": "78", "answer": "Fairly poor"},
//     {"qid": "79", "answer": "No"},
//     {"qid": "80", "answer": "Yes"}
//   ]
// };
