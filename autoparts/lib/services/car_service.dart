import 'package:autoparts/models/car.dart';
import 'package:autoparts/models/models.dart';
import 'package:autoparts/services/firebase_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CarsService extends ChangeNotifier {
  List<CarParts> cars = [];
  late Car selectedCar;
  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  CarsService() {
    getAllEspesificDocs();
  }

  Future<void> getAllEspesificDocs() async {
    isLoading = true;
    notifyListeners();

    QuerySnapshot<Map<String, dynamic>> data = await FirebaseIntance.fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection("idUser")
        .doc("Stratus")
        .collection("parts")
        .get();

    QuerySnapshot<Map<String, dynamic>> getHomeCars = await FirebaseIntance
        .fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection("idUser")
        .get();

    final r = getHomeCars.docs.map((e) => e.id).toList();

    DocumentSnapshot<Map<String, dynamic>> carData = await FirebaseIntance
        .fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection("idUser")
        .doc("Stratus")
        .get();

    selectedCar = Car.fromMap(carData.data()!);
    selectedCar.id = carData.id;

    final lisCars = data.docs.map((e) => CarParts.fromSnapshot(e)).toList();

    cars.addAll(lisCars);

    isLoading = false;
    notifyListeners();
  }

  Future<List<CarParts>> getAllDocs(String typeCar) async {
    QuerySnapshot<Map<String, dynamic>> autoPartsData = await FirebaseIntance
        .fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection("idUser")
        .doc(typeCar)
        .collection("Parts")
        .get();

    DocumentSnapshot<Map<String, dynamic>> carData = await FirebaseIntance
        .fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection("idUser")
        .doc(typeCar)
        .get();

    selectedCar = Car.fromMap(carData.data()!);
    selectedCar.id = carData.id;

    final lisCars =
        autoPartsData.docs.map((e) => CarParts.fromSnapshot(e)).toList();

    return lisCars;
  }

  Future<void> setCar(String name) async {
    final car = Car(
        engine: "engine", model: "model", year: "year", date: Timestamp.now());
    await FirebaseIntance.fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection(UniqueKey().toString())
        .doc(name)
        .set(car.toMap());

    // await FirebaseIntance.fireBase.collection("Vehicle").add();
  }
}
