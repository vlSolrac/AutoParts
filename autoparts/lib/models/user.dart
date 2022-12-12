import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserCar {
  UserCar({
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

  factory UserCar.fromJson(String str) => UserCar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCar.fromMap(Map<String, dynamic> json) => UserCar(
        email: json["Email"],
        password: json["Password"],
        nickname: json["Nickname"] ?? "",
        celphone: json["CelPhone"],
        middlename: json["MiddleName"],
        name: json["Name"],
        creationDate: json["CreationDate"],
        img: json["Img"],
      );

  factory UserCar.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) =>
      UserCar(
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
