import 'package:autoparts/themes/themes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
//Parametes.

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [ThemeApp.secondary, Colors.tealAccent[400]!]),
            ),
            child: Stack(
              children: [],
            ),
          )
        ],
      ),
    ));
  }
}
