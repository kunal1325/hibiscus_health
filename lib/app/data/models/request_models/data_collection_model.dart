class DataCollectionModel {
  int? height = 0;
  int? weight = 0;
  String? gender = "";
  String? smoking = "";
  String? bloodPressureMedication = "";
  bool? diabetes = false;

  DataCollectionModel({this.height, this.weight,
    this.gender, this.smoking,this.bloodPressureMedication, this.diabetes});

  DataCollectionModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    gender = json['gender'];
    smoking = json['smoking'];
    bloodPressureMedication = json['bloodPressureMedication'];
    diabetes = json['diabetes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['gender'] = this.gender;
    data['smoking'] = this.smoking;
    data['bloodPressureMedication'] = this.bloodPressureMedication;
    data['diabetes'] = this.diabetes;
    return data;
  }
}
