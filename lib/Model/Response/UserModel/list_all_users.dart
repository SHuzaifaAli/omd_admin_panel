class ListAllUsers {
  int? code;
  String? message;
  List<Response>? response;

  ListAllUsers({this.code, this.message, this.response});

  ListAllUsers.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['email'] = this.email;
    data['id_user'] = this.idUser;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['status'] = this.status;
    return data;
  }
}
