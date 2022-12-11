import 'package:autoparts/firebase_options.dart';
import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/screens/home_screen.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarsService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Car',
      theme: ThemeApp.lightTheme,
      initialRoute: RoutesApp.fistHome,
      routes: RoutesApp.routes,
    );
  }
}
