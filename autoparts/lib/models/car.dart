import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  Car({
    required this.engine,
    required this.model,
    required this.year,
    required this.date,
    this.id,
    this.img,
  });

  final String engine;
  final String model;
  final String year;
  final Timestamp date;
  String? id;
  String? img;

  factory Car.fromJson(String str) => Car.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        engine: json["Engine"],
        model: json["Model"],
        img: json["Img"] ?? "",
        year: json["Year"],
        date: json["Date"],
      );

  factory Car.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => Car(
        id: json.id,
        engine: json["Engine"],
        model: json["Model"],
        img: json["Img"] ?? "",
        year: json["Year"],
        date: json["Date"],
      );

  Map<String, dynamic> toMap() => {
        "Engine": engine,
        "Model": model,
        "Img": img,
        "Year": year,
        "Date": date
      };
}
