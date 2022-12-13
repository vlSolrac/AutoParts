import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:autoparts/models/models.dart';
import 'package:autoparts/services/firebase_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class CarsService extends ChangeNotifier {
  List<CarParts> cars = [];
  List<Car> carss = [];
  late Car selectedCar;
  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  CarsService() {
    getAllEspesificDocs();
  }

  Future<List<Car>> getCars() async {
    final idUser = FirebaseIntance.firebaseAuth.currentUser!.uid;

    QuerySnapshot<Map<String, dynamic>> getHomeCars = await FirebaseIntance
        .fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection(idUser)
        .get();

    // final r = getHomeCars.docs.map((e) => e.id).toList();
    final listCar = [];
    getHomeCars.docs.forEach((element) async {
      DocumentSnapshot<Map<String, dynamic>> carData = await FirebaseIntance
          .fireBase
          .collection("Autoparts")
          .doc("Vehicle")
          .collection(idUser)
          .doc(element.id)
          .get();

      selectedCar = Car.fromMap(carData.data()!);
      selectedCar.id = carData.id;

      listCar.add(selectedCar);

      carss = [...listCar];
      carss.sort(
        (a, b) {
          return a.date!.compareTo(b.date!);
        },
      );
    });

    return carss;
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

  void updateSelectedProductImage(String path) {
    selectedCar.img = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dwph5cqvi/auto/upload?upload_preset=ProductsApp');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }

    newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }

  Future saveOrCreateProduct(Car car) async {
    isSaving = true;
    notifyListeners();

    if (car.id == null) {
      // Es necesario crear
      await createCar(car);
    } else {
      // Actualizar
      await updateCar(car);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateCar(Car car) async {
    final idUser = FirebaseIntance.firebaseAuth.currentUser!.uid;

    await FirebaseIntance.fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection(idUser)
        .doc(car.id)
        .update(car.toMap());

    final index = carss.indexWhere((element) => element.id == car.id);
    carss[index] = car;

    return car.id!;
  }

  Future<String> createCar(Car car) async {
    final idUser = FirebaseIntance.firebaseAuth.currentUser!.uid;

    car.id = car.name;
    car.date = Timestamp.now();
    await FirebaseIntance.fireBase
        .collection("Autoparts")
        .doc("Vehicle")
        .collection(idUser)
        .doc(car.id)
        .set(car.toMap());

    carss.add(car);

    return car.id!;
  }
}
