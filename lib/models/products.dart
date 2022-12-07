class Product {
  Product(
      {required this.id,
      required this.title,
      required this.desc,
      required this.img,
      required this.categories,
      required this.size,
      required this.color,
      required this.price,
      required this.createdAt,
      required this.updatedAt,
      required this.colour,
      this.isFavourite,
      required this.v,
      this.rating});

  String id;
  String title;
  String desc;
  String img;
  List<String> categories;
  String size;
  String color;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  bool? isFavourite;
  int? rating;
  List<String>? colour;
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        title: json["title"],
        desc: json["desc"],
        img: json["img"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        size: json["size"],
        color: json["color"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isFavourite: json["isFavourite"],
        rating: json["rating"],
        colour: json["colour"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "desc": desc,
        "img": img,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "size": size,
        "color": color,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
