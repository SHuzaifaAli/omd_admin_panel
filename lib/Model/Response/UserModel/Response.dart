class Response {
  Response({
      this.address, 
      this.createdAt, 
      this.email, 
      this.idUser, 
      this.name, 
      this.password, 
      this.phone, 
      this.status,});

  Response.fromJson(dynamic json) {
    address = json['address'];
    createdAt = json['created_at'];
    email = json['email'];
    idUser = json['id_user'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    status = json['status'];
  }
  String? address;
  String? createdAt;
  String? email;
  int? idUser;
  String? name;
  String? password;
  String? phone;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['created_at'] = createdAt;
    map['email'] = email;
    map['id_user'] = idUser;
    map['name'] = name;
    map['password'] = password;
    map['phone'] = phone;
    map['status'] = status;
    return map;
  }

}