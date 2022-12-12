import 'dart:convert';

import 'package:autoparts/helpers/preferences.dart';
import 'package:autoparts/models/models.dart';
import 'package:autoparts/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = "identitytoolkit.googleapis.com";
  final String _firebaseToken = "AIzaSyCgxxPFZdS7EvAmsDLavSe4VZP45n1QX5M";
  bool hasToken = false;

  Future<String?> createUser(
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
          creationDate: Timestamp.now());

      await FirebaseIntance.fireBase
          .collection("Autoparts")
          .doc("User")
          .collection("Users")
          .doc(userCar.id)
          .set(userCar.toMap());
    } catch (e) {
      print(e);
    }
  }

  Future<String?> loginUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };

    final url = Uri.https(
        _baseUrl, "/v1/accounts:signInWithPassword", {"key": _firebaseToken});

    final res = await http.post(url, body: jsonEncode(authData));

    final Map<String, dynamic> decodeData = jsonDecode(res.body);
    print(decodeData);

    if (decodeData.containsKey("idToken")) {
      Preferences.token = decodeData["idToken"];
      Preferences.idUser = decodeData["idToken"];
      return null;
    }

    return decodeData["error"]["message"];
  }

  Future logout() async {
    await Preferences.deletePreferences();
    notifyListeners();
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
