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
