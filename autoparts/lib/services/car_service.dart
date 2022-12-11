import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:autoparts/models/models.dart';
import 'dart:io';

class CarsService extends ChangeNotifier {
  List<Car> cars = [];
  late Car selectedProduct;
  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  CarsService() {
    // getAllDocs();
  }

  Future<void> getAllEspesificDocs() async {
    isLoading = true;
    notifyListeners();

    QuerySnapshot<Map<String, dynamic>> data =
        await FirebaseFirestore.instance.collection('Stratus').get();

    final lisCars = data.docs.map((e) => Car.fromSnapshot(e)).toList();

    cars.addAll(lisCars);

    isLoading = false;
    notifyListeners();
  }

  Future<List<Car>> getAllDocs(String typeCar) async {
    // isLoading = true;
    // notifyListeners();

    QuerySnapshot<Map<String, dynamic>> data =
        await FirebaseFirestore.instance.collection(typeCar).get();

    final lisCars = data.docs.map((e) => Car.fromSnapshot(e)).toList();

    // cars.addAll(lisCars);

    // isLoading = false;
    // notifyListeners();

    return lisCars;
  }

  Future<void> setCar(String name) {
    print("name");

    FirebaseFirestore.instance.collection(collectionPath)
     }
}
