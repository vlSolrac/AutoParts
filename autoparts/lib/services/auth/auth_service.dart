import 'package:flutter/material.dart';

import 'package:autoparts/helpers/preferences.dart';
import 'package:autoparts/models/models.dart';
import 'package:autoparts/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  bool hasToken = false;

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

      return true;
    } catch (e) {
      return false;
      print(e);
    }
  }

  Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await Preferences.deletePreferences();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<String?> getToken() async {
    final token = Preferences.token;

    if (token.isNotEmpty) {
      hasToken = true;
      return Preferences.token;
    }
    return "";
  }
}
