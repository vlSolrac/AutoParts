import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HeaderBox extends StatelessWidget {
  const HeaderBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [ThemeApp.secondary, Colors.tealAccent[400]!]),
      ),
      child: Stack(
        children: const [
          Positioned(top: 90, left: 30, child: Bubble()),
          Positioned(top: -40, left: -30, child: Bubble()),
          Positioned(top: -50, right: -20, child: Bubble()),
          Positioned(bottom: -50, left: 10, child: Bubble()),
          Positioned(bottom: 120, right: 20, child: Bubble()),
        ],
      ),
    );
  }
}
