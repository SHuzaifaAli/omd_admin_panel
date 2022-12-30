class OneUser {
  int? code;
  String? message;
  Response? response;

  OneUser({this.code, this.message, this.response});

  OneUser.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  String? address;
  String? createdAt;
  String? email;
  int? idUser;
  String? name;
  String? password;
  String? phone;
  int? status;

  Response(
      {this.address,
        this.createdAt,
        this.email,
        this.idUser,
        this.name,
        this.password,
        this.phone,
        this.status});

  Response.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    createdAt = json['created_at'];
    email = json['email'];
    idUser = json['id_user'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['created_at'] = createdAt;
    data['email'] = email;
    data['id_user'] = idUser;
    data['name'] = name;
    data['password'] = password;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }
}
