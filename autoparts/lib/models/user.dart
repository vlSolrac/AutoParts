import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.email,
    required this.password,
    required this.nickname,
    required this.celphone,
    required this.middlename,
    required this.name,
    required this.creationDate,
    this.id,
    this.img,
  });

  String email;
  String password;
  String nickname;
  String celphone;
  String middlename;
  String name;
  Timestamp creationDate;
  String? id;
  String? img;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["Email"],
        password: json["Password"],
        nickname: json["Nickname"] ?? "",
        celphone: json["CelPhone"],
        middlename: json["MiddleName"],
        name: json["Name"],
        creationDate: json["CreationDate"],
        img: json["Img"],
      );

  factory User.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) =>
      User(
        id: json.id,
        email: json["Email"],
        password: json["Password"],
        nickname: json["Nickname"] ?? "",
        celphone: json["CelPhone"],
        middlename: json["MiddleName"],
        name: json["Name"],
        creationDate: json["CreationDate"],
        img: json["Img"],
      );

  Map<String, dynamic> toMap() => {
        "Email": email,
        "Password": password,
        "Nickname": nickname,
        "CelPhone": celphone,
        "MiddleName": middlename,
        "Name": name,
        "Img": img,
        "CreationDate": creationDate
      };
}
