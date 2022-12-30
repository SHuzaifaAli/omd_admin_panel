// To parse this JSON data, do
//
//     final listAllOrders = listAllOrdersFromJson(jsonString);

import 'dart:convert';

ListAllOrders listAllOrdersFromJson(String str) => ListAllOrders.fromJson(json.decode(str));

String listAllOrdersToJson(ListAllOrders data) => json.encode(data.toJson());

class ListAllOrders {
  ListAllOrders({
    this.code,
    this.message,
    this.response,
  });

  int? code;
  String? message;
  List<Response>? response;

  factory ListAllOrders.fromJson(Map<String, dynamic> json) => ListAllOrders(
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
    this.price,
    this.quantity,
  });

  int? idOrders;
  int? idProduct;
  String? invoice;
  int? price;
  int? quantity;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    idOrders: json["id_orders"],
    idProduct: json["id_product"],
    invoice: json["invoice"],
    price: json["price"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id_orders": idOrders,
    "id_product": idProduct,
    "invoice": invoice,
    "price": price,
    "quantity": quantity,
  };
}
