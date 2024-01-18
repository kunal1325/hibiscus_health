class UserModel {
  Token? token;
  String? msg;
  int? status;
  int? userID;
  String? dietitianID;
  String? patientName;
  String? dietitianName;
  String? email;
  int? age;

  UserModel({this.token, this.msg, this.status, this.userID, this.dietitianID, this.patientName, this.dietitianName, this.email, this.age});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    msg = json['msg'];
    status = json['status'];
    userID = json['userID'];
    dietitianID = json['dietitianID'];
    patientName = json['patientName'];
    dietitianName = json['dietitianName'];
    email = json['email'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    data['userID'] = this.userID;
    data['dietitianID'] = this.dietitianID;
    data['patientName'] = this.patientName;
    data['dietitianName'] = this.dietitianName;
    data['email'] = this.email;
    data['age'] = this.age;
    return data;
  }
}

class Token {
  String? refresh;
  String? access;

  Token({this.refresh, this.access});

  Token.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    return data;
  }
}
