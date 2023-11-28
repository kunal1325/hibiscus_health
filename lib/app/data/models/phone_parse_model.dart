import '../../../import.dart';

class ValidatePhone {
  bool isValid;
  PhoneNumber? parseResult;

  ValidatePhone(this.isValid, this.parseResult);
}

class ParseResult {
  PhoneNumber? phoneNumber;
  String errorCode;

  ParseResult._({
    this.phoneNumber,
    required this.errorCode,
  });

  bool get hasError => errorCode != null;

  factory ParseResult(PhoneNumber phoneNumber) => ParseResult._(
    phoneNumber: phoneNumber, errorCode: '',
  );

  factory ParseResult.error(code) => ParseResult._(errorCode: code);

  @override
  String toString() {
    return 'ParseResult{'
        'e164: ${phoneNumber?.e164}, '
        'type: ${phoneNumber?.type}, '
        'international: ${phoneNumber?.international}, '
        'national: ${phoneNumber?.national}, '
        'countryCode: ${phoneNumber?.countryCode}, '
        'nationalNumber: ${phoneNumber?.nationalNumber}, '
        'errorCode: $errorCode}';
  }
}

class Region {
  final String code;
  final int prefix;

  Region(
      this.code,
      this.prefix,
      );

  int compareTo(region) => code.compareTo(region.code);

  @override
  String toString() {
    return 'Region{code: $code, prefix: $prefix}';
  }
}

class ParsePhone {
  String e164;
  String type;
  String international;
  String national;
  String countryCode;
  String nationalNumber;
  String errorCode;

  ParsePhone(
      {required this.e164,
        required this.type,
        required this.international,
        required this.national,
        required this.countryCode,
        required this.nationalNumber,
        required this.errorCode});

  ParsePhone.fromJson(Map<dynamic, dynamic> json) :
        e164 = json['e164'],
        type = json['type'],
        international = json['international'],
        national = json['national'],
        countryCode = json['countryCode'],
        nationalNumber = json['nationalNumber'],
        errorCode = json['errorCode'];


  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['e164'] = this.e164;
    data['type'] = this.type;
    data['international'] = this.international;
    data['national'] = this.national;
    data['countryCode'] = this.countryCode;
    data['nationalNumber'] = this.nationalNumber;
    data['errorCode'] = this.errorCode;
    return data;
  }
}
