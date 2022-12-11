import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CarParts {
  CarParts({
    required this.category,
    required this.description,
    required this.store,
    required this.manpower,
    required this.price,
    required this.date,
    this.id,
    this.img,
  });

  final String category;
  final String description;
  final String store;
  final double manpower;
  final double price;
  final Timestamp date;
  String? id;
  String? img;

  factory CarParts.fromJson(String str) => CarParts.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarParts.fromMap(Map<String, dynamic> json) => CarParts(
        category: json["Category"],
        description: json["Description"],
        img: json["Img"] ?? "",
        store: json["Store"],
        manpower: json["Manpower"].toDouble(),
        price: json["Price"].toDouble(),
        date: json["Date"]
      );

  factory CarParts.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) =>
      CarParts(
        id: json.id,
        category: json["Category"],
        description: json["Description"],
        img: json["Img"] ?? "",
        store: json["Store"],
        manpower: json["Manpower"] as double,
        price: json["Price"] as double,
        date: json["Date"]
      );

  Map<String, dynamic> toMap() => {
        "Category": category,
        "Description": description,
        "Img": img,
        "Store": store,
        "Manpower": manpower,
        "Price": price,
        "Date": date
      };
}
