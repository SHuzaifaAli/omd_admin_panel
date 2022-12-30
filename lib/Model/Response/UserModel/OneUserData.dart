import 'Response.dart';

class OneUserData {
  OneUserData({
      this.code, 
      this.message, 
      this.response,});

  OneUserData.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  int? code;
  String? message;
  Response? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (response != null) {
      map['response'] = response!.toJson();
    }
    return map;
  }

}