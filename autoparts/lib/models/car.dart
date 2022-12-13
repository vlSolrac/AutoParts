import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  Car({
    required this.engine,
    required this.model,
    required this.year,
    this.date,
    this.id,
    this.img,
    this.name,
  });

  String engine;
  String model;
  String year;
  Timestamp? date;
  String? id;
  String? img;
  String? name;

  String get image {
    return img == null
        ? "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"
        : img!;
  }

  factory Car.fromJson(String str) => Car.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        engine: json["Engine"],
        model: json["Model"],
        img: json["Img"],
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

  Car copy() => Car(
        engine: engine,
        name: name,
        model: model,
        year: year,
        date: date,
        img: img,
        id: id,
      );
}
