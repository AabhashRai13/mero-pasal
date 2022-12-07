// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
    Token({
       required this.id,
       required this.username,
       required this.email,
       required this.isAdmin,
       required this.createdAt,
       required this.updatedAt,
       required this.accessToken,
    });

    String id;
    String username;
    String email;
    bool isAdmin;
    DateTime createdAt;
    DateTime updatedAt;
    String accessToken;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        isAdmin: json["isAdmin"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        accessToken: json["accessToken"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "isAdmin": isAdmin,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "accessToken": accessToken,
    };
}
