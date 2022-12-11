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
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
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
              children: [
                Positioned(top: 90, left: 30, child: _Bubble()),
                Positioned(top: -40, left: -30, child: _Bubble()),
                Positioned(top: -50, right: -20, child: _Bubble()),
                Positioned(bottom: -50, left: 10, child: _Bubble()),
                Positioned(bottom: 120, right: 20, child: _Bubble()),
              ],
            ),
          ),
          child
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.25,
      height: size.height * 0.12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.09)),
    );
  }
}
