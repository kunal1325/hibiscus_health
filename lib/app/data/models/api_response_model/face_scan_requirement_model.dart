class FaceScanRequirementModel {
  String? configId;
  String? result;
  String? deviceID;
  String? token;
  String? roleID;
  String? refreshToken;
  String? encryptedProfile;

  FaceScanRequirementModel(
      {this.configId,
        this.result,
        this.deviceID,
        this.token,
        this.roleID,
        this.refreshToken,
        this.encryptedProfile});

  FaceScanRequirementModel.fromJson(Map<String, dynamic> json) {
    configId = json['configId'];
    result = json['result'];
    deviceID = json['DeviceID'];
    token = json['Token'];
    roleID = json['RoleID'];
    refreshToken = json['RefreshToken'];
    encryptedProfile = json['encryptedProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['configId'] = this.configId;
    data['result'] = this.result;
    data['DeviceID'] = this.deviceID;
    data['Token'] = this.token;
    data['RoleID'] = this.roleID;
    data['RefreshToken'] = this.refreshToken;
    data['encryptedProfile'] = this.encryptedProfile;
    return data;
  }
}
