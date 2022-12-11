import 'package:flutter/material.dart';


class CarDetailScreen extends StatelessWidget {
 
//Parametes.

  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    //global variables.
    // final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;
  
    return const Scaffold(
      body: Center(
         child: Text('CarDetailScreen'),
      ),
    );
  }
}