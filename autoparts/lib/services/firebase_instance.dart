import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseIntance extends ChangeNotifier {
  static FirebaseFirestore fireBase = FirebaseFirestore.instance;

  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  
}
