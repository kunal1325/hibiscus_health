class DataCollectionModel {
  String? identifier = "";
  int? age = 0;
  int? height = 0;
  int? weight = 0;
  String? gender = "";
  String? smoking = "";
  String? bloodPressureMedication = "";
  bool? diabetes = false;

  DataCollectionModel({this.identifier, this.age,this.height, this.weight,
    this.gender, this.smoking,this.bloodPressureMedication, this.diabetes});

  DataCollectionModel.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    gender = json['gender'];
    smoking = json['smoking'];
    bloodPressureMedication = json['bloodPressureMedication'];
    diabetes = json['diabetes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['age'] = this.age;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['gender'] = this.gender;
    data['smoking'] = this.smoking;
    data['bloodPressureMedication'] = this.bloodPressureMedication;
    data['diabetes'] = this.diabetes;
    return data;
  }
}
