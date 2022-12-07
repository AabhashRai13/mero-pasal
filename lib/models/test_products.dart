import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';

class TestProduct {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  TestProduct({
    required this.id,
    required this.images,
    required this.colors,
    required this.title,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.price,
    required this.description,
  });
  factory TestProduct.fromJson(Map<String, dynamic> json) => TestProduct(
      id: json["_id"],
      images: json["img"],
      colors: json["color"],
      title: json["title"],
      price: json["price"],
      description: json["desc"]);
  Map<String, dynamic> toJson() => {
        "_id": id,
        "img": images,
        "color": colors,
        "title": title,
        "price": price,
        "desc": description,
      };
}

List<TestProduct> demoProducts = [
  TestProduct(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless controller for ps4",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  TestProduct(
    id: 2,
    images: [
      "assets/images/popular_product-2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport white men's pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  TestProduct(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.5,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  TestProduct(
    id: 4,
    images: [
      ImageAssets.wirelessHeadset,
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];
const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
