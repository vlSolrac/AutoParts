import 'package:autoparts/themes/themes.dart';
import 'package:flutter/material.dart';

class TextInputContainer extends StatelessWidget {
  final Widget child;

  const TextInputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: ThemeApp.secondary,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}