import 'package:flutter/material.dart';
import 'package:autoparts/widgets/widgets.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(top: 0, left: 0, right: 0, child: HeaderBox()),
          const Positioned(top: 0, left: 0, right: 0, child: HeaderIcon()),
          child,
        ],
      ),
    );
  }
}