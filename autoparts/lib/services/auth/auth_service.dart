import 'package:flutter/material.dart';

import 'package:autoparts/helpers/preferences.dart';
import 'package:autoparts/models/models.dart';
import 'package:autoparts/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  bool hasIdUSer = false;

  late UserCar currentUser;

  Future<bool> createUser(
      {required String email,
      required String password,
      required String celphone,
      required String name,
      required String middlename,
      required String nickname}) async {
    try {
      UserCredential res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final id = res.user!.uid;

      final userCar = UserCar(
        id: id,
        img: "imagen",
        email: email,
        password: password,
        nickname: nickname,
        celphone: celphone,
        middlename: middlename,
        name: name,
        creationDate: Timestamp.now(),
      );

      await FirebaseIntance.fireBase
          .collection("Autoparts")
          .doc("User")
          .collection("Users")
          .doc(userCar.id)
          .set(userCar.toMap());

      return true;
    } catch (e) {
      return false;
      print(e);
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      UserCredential res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Preferences.idUser = res.user!.uid;

      await getCurrentUse();

      return true;
    } catch (e) {
      return false;
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await Preferences.deletePreferences();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<String> getCurrentUse() async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    if (id == null) return "";

    final userCar = await FirebaseIntance.fireBase
        .collection("Autoparts")
        .doc("User")
        .collection("Users")
        .doc(id)
        .get();

    currentUser = UserCar.fromMap(userCar.data()!);
    currentUser.id = userCar.id;

    await Future.delayed(const Duration(milliseconds: 1000));

    return id;
  }

  Future<String?> getIdUser() async {
    final id = Preferences.idUser;

    if (id.isNotEmpty) {
      hasIdUSer = true;
      return Preferences.idUser;
    }
    return "";
  }
}
