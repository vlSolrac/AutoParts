import 'package:flutter/material.dart';

class ThemeApp {
  static Color primary = Colors.teal;
  static Color secondary = Colors.teal[800]!;

  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: primary,
    ),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: secondary,
    ),
  );
}
