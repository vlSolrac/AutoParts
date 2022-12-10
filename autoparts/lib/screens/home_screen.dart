import 'package:autoparts/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
//Parametes.

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    // final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;
    final firebaseService = Provider.of<CarsService>(context);

    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: firebaseService.cars.length,
          itemBuilder: (BuildContext context, int index) {
            final car = firebaseService.cars[index];
            return Text(car.description);
          },
        ),
      ),
    );
  }
}
