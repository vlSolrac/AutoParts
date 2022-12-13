import 'package:flutter/material.dart';

import 'package:autoparts/screens/screens.dart';
import 'package:autoparts/services/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
//Parametes.

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    // final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.getCurrentUse(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (!snapshot.hasData) return const Text("Espere");

            if (snapshot.data == "") {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const FistHomeScreen(),
                        transitionDuration: const Duration(seconds: 0)));
                // Navigator.popAndPushNamed(context, RoutesApp.home);
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const DrawerCustomScreen(),
                        transitionDuration: const Duration(seconds: 0)));
                // Navigator.popAndPushNamed(context, RoutesApp.home);
              });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
