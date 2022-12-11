import 'package:autoparts/screens/login_screen.dart';
import 'package:autoparts/screens/screens.dart';
import 'package:flutter/material.dart';

class RoutesApp {
  static String home = "home";
  static String login = "login";
  static String fistHome = "fistHome";
  static String signup = "signup";
  static String carDetail = "carDetail";
  static String addCar = "addCar";

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (p0) => const HomeScreen(),
    fistHome: (p0) => const FistHomeScreen(),
    login: (p0) => const LoginScreen(),
    signup: (p0) => const RegisterScreen(),
    carDetail: (p0) => const CarDetailScreen(),
    addCar: (p0) => const AddCarScreen(),
  };

  
}
