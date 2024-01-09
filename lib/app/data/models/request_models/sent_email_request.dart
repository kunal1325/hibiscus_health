class SentEmailRequest {
  String email = "";
  double score = 0;
  String hash = "";

  SentEmailRequest({required this.email,required this.score, required this.hash});

  SentEmailRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    score = json['score'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['score'] = this.score;
    data['hash'] = this.hash;
    return data;
  }
}
