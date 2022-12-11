import 'package:flutter/material.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class FistHomeScreen extends StatelessWidget {
//Parametes.

  const FistHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: LoginBackgroud(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderFistHome(),
              SizedBox(height: size.height * 0.06),
              LottieBuilder.asset(
                "assets/lotties/car_white.json",
                width: size.width * 0.95,
                repeat: true,
              ),
              SizedBox(height: size.height * 0.05),
              const RoudenButtonFistHome(),
            ],
          ),
        ),
      ),
    );
  }
}


