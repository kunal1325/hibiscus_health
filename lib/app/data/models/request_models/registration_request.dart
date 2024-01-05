class RegisterRequest {
  String? email;
  String? first_name;
  String? last_name;
  String? phone_number;
  String? password;
  String? password2;
  String? user_role;
  String? unique_code;
  String? DOB;

  RegisterRequest({
    this.email,
    this.first_name,
    this.last_name,
    this.phone_number,
    this.password,
    this.password2,
    this.user_role,
    this.DOB,
    this.unique_code
  });

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    phone_number = json['phone_number'];
    password = json['password'];
    password2 = json['password2'];
    user_role = json['user_role'];
    unique_code = json['unique_code'];
    DOB = json['DOB'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['phone_number'] = this.phone_number;
    data['password'] = this.password;
    data['password2'] = this.password2;
    data['user_role'] = this.user_role;
    data['unique_code'] = this.unique_code;
    data['DOB'] = this.DOB;
    return data;
  }
}
