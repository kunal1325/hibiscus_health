class UserModel {
  Token? token;
  String? msg;
  int? status;
  int? userID;
  String? dietitianID;

  UserModel({this.token, this.msg, this.status, this.userID, this.dietitianID});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    msg = json['msg'];
    status = json['status'];
    userID = json['userID'];
    dietitianID = json['dietitianID'];
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
