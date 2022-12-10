import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  Car({
    required this.category,
    required this.description,
    this.id,
    this.img,
    required this.place,
    required this.manpower,
    required this.price,
  });

  final String category;
  final String description;
  String? id;
  String? img;
  final String place;
  final double manpower;
  final double price;

  factory Car.fromJson(String str) => Car.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        category: json["category"],
        description: json["description"],
        img: json["img"] ?? "",
        place: json["place"],
        manpower: json["manpower"].toDouble(),
        price: json["price"].toDouble(),
      );

  factory Car.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => Car(
        id: json.id,
        category: json["category"],
        description: json["description"],
        img: json["img"] ?? "",
        place: json["place"],
        manpower: json["manpower"] as double,
        price: json["price"] as double,
      );

  Map<String, dynamic> toMap() => {
        "category": category,
        "description": description,
        "id": id,
        "img": img,
        "place": place,
        "manpower": manpower,
        "price": price,
      };
}
