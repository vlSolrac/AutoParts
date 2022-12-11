import 'package:flutter/material.dart';

import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/themes/themes.dart';
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
      body: _LoginBackgroud(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HeaderFistHome(),
              ),
              SizedBox(height: size.height * 0.06),
              LottieBuilder.asset(
                "assets/lotties/car_white.json",
                width: size.width * 0.95,
                repeat: true,
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: RoundedButtonFistHome(
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, RoutesApp.login),
                  color: ThemeApp.primary,
                  fontSize: size.height * 0.024,
                  text: ConstApp.englishConst["fist_home_button"],
                  paddingInside: size.height * 0.02,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginBackgroud extends StatelessWidget {
  final Widget child;
  const _LoginBackgroud({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              AssetsApp.mainTop,
              width: size.width * 0.35,
              color: ThemeApp.primary,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AssetsApp.loginBottom,
              width: size.width * 0.45,
              color: ThemeApp.primary,
            ),
          ),
          child
        ],
      ),
    );
  }
}
