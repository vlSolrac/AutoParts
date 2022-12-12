import 'package:autoparts/themes/theme.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ThemeApp.primary),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeApp.primary, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: ThemeApp.primary)
            : null);
  }
}
