import 'package:flutter/material.dart';

import 'package:autoparts/themes/themes.dart';

class FistHomeBackgroud extends StatelessWidget {
  final Widget child;
  const FistHomeBackgroud({
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
