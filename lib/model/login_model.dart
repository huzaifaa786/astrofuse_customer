import 'device_info_login_model.dart';

class LoginModel {
  LoginModel(
      {this.contactNo, this.deviceInfo, this.countryCode, this.password});

  String? contactNo;
  String? countryCode;
  String? password;
  DeviceInfoLoginModel? deviceInfo = DeviceInfoLoginModel();

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        contactNo: json["contactNo"],
        countryCode: json["countryCode"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "contactNo": contactNo,
        "userDeviceDetails": deviceInfo,
        "countryCode": countryCode,
        "password": password,
      };
}
