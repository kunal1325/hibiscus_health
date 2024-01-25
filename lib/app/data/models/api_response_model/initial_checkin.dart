import 'package:hibiscus_health/import.dart';

class InitialCheckInResponse {
  List<CheckInModel>? dailyCheckIns;

  InitialCheckInResponse({this.dailyCheckIns});

  InitialCheckInResponse.fromJson(Map<String, dynamic> json) {
    if (json['Initial Assessment'] != null) {
      dailyCheckIns = <CheckInModel>[];
      json['Initial Assessment'].forEach((v) {
        dailyCheckIns!.add(new CheckInModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailyCheckIns != null) {
      data['Initial Assessment'] =
          this.dailyCheckIns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
