import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
//Parametes.

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    // final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;
    // //https://www.youtube.com/watch?v=Evu19gTKaFo

    final firebaseService = Provider.of<CarsService>(context);
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cars"),
        leading: CircleAvatar(
          backgroundColor: ThemeApp.secondary.withOpacity(0.5),
          child: authService.currentUser.img == null
              ? Text(authService.currentUser.nickname
                  .substring(0, 2)
                  .toUpperCase())
              : Image(
                  image: NetworkImage(authService.currentUser.img!),
                  fit: BoxFit.cover),
        ),
        actions: [
          IconButton(
              onPressed: () {
                authService.logout();
                Navigator.popAndPushNamed(context, RoutesApp.login);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(child: Text(authService.currentUser.nickname)
          // child: FutureBuilder(
          //   future: firebaseService.getAllDocs("Stratus"),
          //   builder: (_, AsyncSnapshot<List<CarParts>> snapshot) {
          //     final allParts = snapshot.data;
          //     return !snapshot.hasData
          //         ? SizedBox(
          //             height: size.height * 0.01,
          //             width: double.infinity,
          //             child: const CupertinoActivityIndicator(),
          //           )
          //         : ListView.builder(
          //             itemCount: allParts!.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               final car = allParts[index];
          //               return Text(car.description);
          //             },
          //           );
          //   },
          ),
    );
  }
}
