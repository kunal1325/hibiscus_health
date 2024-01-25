class DailyCheckInResponse {
  List<CheckInModel>? dailyCheckIns;

  DailyCheckInResponse({this.dailyCheckIns});

  DailyCheckInResponse.fromJson(Map<String, dynamic> json) {
    if (json['Daily Check-ins'] != null) {
      dailyCheckIns = <CheckInModel>[];
      json['Daily Check-ins'].forEach((v) {
        dailyCheckIns!.add(new CheckInModel.fromJson(v));
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

class CheckInModel {
  String? model;
  int? pk;
  Fields? fields;

  CheckInModel({this.model, this.pk, this.fields});

  CheckInModel.fromJson(Map<String, dynamic> json) {
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
