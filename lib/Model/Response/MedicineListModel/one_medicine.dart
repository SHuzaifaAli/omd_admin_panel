// To parse this JSON data, do
//
//     final oneMedicine = oneMedicineFromJson(jsonString);

import 'dart:convert';

OneMedicine oneMedicineFromJson(String str) => OneMedicine.fromJson(json.decode(str));

String oneMedicineToJson(OneMedicine data) => json.encode(data.toJson());

class OneMedicine {
  OneMedicine({
    this.message,
    this.response,
  });

  String? message;
  Response? response;

  factory OneMedicine.fromJson(Map<String, dynamic> json) => OneMedicine(
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "response": response!.toJson(),
  };
}

class Response {
  Response({
    this.createdAt,
    this.description,
    this.idCategory,
    this.idProduct,
    this.image,
    this.name,
    this.price,
    this.status,
  });

  String? createdAt;
  String? description;
  int? idCategory;
  int? idProduct;
  String? image;
  String? name;
  int? price;
  int? status;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    createdAt: json["created_at"],
    description: json["description"],
    idCategory: json["id_category"],
    idProduct: json["id_product"],
    image: json["image"],
    name: json["name"],
    price: json["price"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "description": description,
    "id_category": idCategory,
    "id_product": idProduct,
    "image": image,
    "name": name,
    "price": price,
    "status": status,
  };
}
