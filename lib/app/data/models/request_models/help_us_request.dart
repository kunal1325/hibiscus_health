class HelpUsRequest {
  String? full_name;
  String? email;
  String? phone_number;
  String? issue;
  String? message;

  HelpUsRequest({this.full_name, this.email, this.phone_number, this.issue, this.message});

  HelpUsRequest.fromJson(Map<String, dynamic> json) {
    full_name = json['full_name'];
    email = json['email'];
    phone_number = json['phone_number'];
    issue = json['issue'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.full_name;
    data['email'] = this.email;
    data['phone_number'] = this.phone_number;
    data['issue'] = this.issue;
    data['message'] = this.message;
    return data;
  }
}
