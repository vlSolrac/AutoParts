import 'package:autoparts/models/models.dart';
import 'package:autoparts/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
//Parametes.

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;
    final firebaseService = Provider.of<CarsService>(context);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: firebaseService.getAllDocs("Stratus"),
          builder: (_, AsyncSnapshot<List<Car>> snapshot) {
            final allParts = snapshot.data;
            return !snapshot.hasData
                ? SizedBox(
                    height: size.height * 0.01,
                    width: double.infinity,
                    child: const CupertinoActivityIndicator(),
                  )
                : ListView.builder(
                    itemCount: allParts!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final car = allParts[index];
                      return Text(car.description);
                    },
                  );
          },
        ),
      ),
    );
  }
}
