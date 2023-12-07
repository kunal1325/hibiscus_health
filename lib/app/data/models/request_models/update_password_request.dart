class UpdatePasswordRequest {
  String email = "";
  String otp = "";
  String new_password = "";

  UpdatePasswordRequest({required this.email, required this.otp, required this.new_password});

  UpdatePasswordRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otp = json['otp'];
    new_password = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['new_password'] = this.new_password;
    return data;
  }
}
