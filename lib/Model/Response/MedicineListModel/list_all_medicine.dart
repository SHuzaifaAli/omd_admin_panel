class ListAllMedicine {
  int? code;
  String? message;
  List<Response>? response;

  ListAllMedicine({this.code, this.message, this.response});

  ListAllMedicine.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? createdAt;
  String? description;
  int? idCategory;
  int? idProduct;
  String? image;
  String? name;
  int? price;
  int? status;

  Response(
      {this.createdAt,
        this.description,
        this.idCategory,
        this.idProduct,
        this.image,
        this.name,
        this.price,
        this.status});

  Response.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    description = json['description'];
    idCategory = json['id_category'];
    idProduct = json['id_product'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['created_at'] = createdAt;
    data['description'] = description;
    data['id_category'] = idCategory;
    data['id_product'] = idProduct;
    data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['status'] = status;
    return data;
  }
}
