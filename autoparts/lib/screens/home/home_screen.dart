import 'package:autoparts/models/car.dart';
import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

    final carService = Provider.of<CarsService>(context);
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          carService.selectedCar = Car(engine: "", model: "", year: "");
          Navigator.pushNamed(context, RoutesApp.addCar);
        },
        backgroundColor: ThemeApp.secondary,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("My Cars"),
        leading: GestureDetector(
          onDoubleTap: () {
            print(authService.currentUser.id!);
          },
          child: CircleAvatar(
            backgroundColor: ThemeApp.secondary.withOpacity(0.5),
            child: authService.currentUser.img == null
                ? Text(authService.currentUser.nickname
                    .substring(0, 2)
                    .toUpperCase())
                : Image(
                    image: NetworkImage(authService.currentUser.img!),
                    fit: BoxFit.cover),
          ),
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
      body: FutureBuilder(
        future: carService.getCars(),
        builder: (BuildContext context, AsyncSnapshot<List<Car>> snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: LottieBuilder.asset("assets/lotties/please_wait.json"),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final car = snapshot.data![index];
                    return GestureDetector(
                        onTap: () {
                          carService.selectedCar =
                              carService.carss[index].copy();
                          Navigator.pushNamed(context, RoutesApp.addCar);
                        },
                        child: CarCardContainer(car: car));
                  },
                );
        },
      ),
    );
  }
}

class CarCardContainer extends StatelessWidget {
  final Car car;
  const CarCardContainer({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CardContainer(
        car: car,
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final Car car;
  const CardContainer({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 7),
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ImageCar(
            urlImg: car.image,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          TextContainer(name: car.id!, year: car.year)
        ],
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final String name;
  final String year;
  const TextContainer({
    Key? key,
    required this.name,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: ThemeApp.primary.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameCar(name: name),
            YearCar(year: year),
          ],
        ),
      ),
    );
  }
}

class YearCar extends StatelessWidget {
  final String year;
  const YearCar({
    Key? key,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          year,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: size.height * 0.018,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class NameCar extends StatelessWidget {
  final String name;
  const NameCar({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: size.height * 0.025,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ImageCar extends StatelessWidget {
  final String urlImg;
  const ImageCar({
    Key? key,
    required this.urlImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: const AssetImage("assets/images/jar_loading.gif"),
          image: NetworkImage(urlImg),
        ),
      ),
    );
  }
}
