import 'package:pasal/models/products.dart';

// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    Cart({
        required this.id,
        required this.userId,
        required this.products,
        required this.createdAt,
        required this.updatedAt,
    });

    String id;
    String userId;
    List<Product> products;
    DateTime createdAt;
    DateTime updatedAt;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        userId: json["userId"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class CartProduct {
    CartProduct({
       required this.productId,
       required this.quantity,
      required  this.id,
    });

    String productId;
    int quantity;
    String id;

    factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        productId: json["productId"],
        quantity: json["quantity"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "_id": id,
    };
}


List<Cart> demoCarts = [];
