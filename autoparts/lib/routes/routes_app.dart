import 'package:flutter/material.dart';
import 'package:autoparts/screens/screens.dart';

class RoutesApp {
  static String home = "home";
  static String login = "login";
  static String fistHome = "fistHome";
  static String signup = "signup";
  static String carDetail = "carDetail";
  static String addCar = "addCar";
  static String splash = "splash";
  static String drawer = "drawer";

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (_) => const HomeScreen(),
    fistHome: (_) => const FistHomeScreen(),
    login: (_) => const LoginScreen(),
    signup: (_) => const RegisterScreen(),
    carDetail: (_) => const CarDetailScreen(),
    addCar: (_) => const AddCarScreen(),
    splash: (_) => const SplashScreen(),
    drawer: (_) => const DrawerCustomScreen()
  };
}
