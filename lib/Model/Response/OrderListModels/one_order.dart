// To parse this JSON data, do
//
//     final oneOrder = oneOrderFromJson(jsonString);

import 'dart:convert';

OneOrder oneOrderFromJson(String str) => OneOrder.fromJson(json.decode(str));

String oneOrderToJson(OneOrder data) => json.encode(data.toJson());

class OneOrder {
  OneOrder({
    this.code,
    this.message,
    this.response,
  });

  int? code;
  String? message;
  List<Response>? response;

  factory OneOrder.fromJson(Map<String, dynamic> json) => OneOrder(
    code: json["code"],
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "response": List<dynamic>.from(response!.map((x) => x.toJson())),
  };
}

class Response {
  Response({
    this.idOrders,
    this.idProduct,
    this.invoice,
    this.name,
    this.price,
    this.quantity,
    this.image,
  });

  int? idOrders;
  int? idProduct;
  String? invoice;
  String? name;
  int? price;
  int? quantity;
  String? image;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    idOrders: json["id_orders"],
    idProduct: json["id_product"],
    invoice: json["invoice"],
    name: json["name"],
    price: json["price"],
    quantity: json["quantity"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id_orders": idOrders,
    "id_product": idProduct,
    "invoice": invoice,
    "name": name,
    "price": price,
    "quantity": quantity,
    "image":image,
  };
}
