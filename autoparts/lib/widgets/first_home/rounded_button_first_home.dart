import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RoudenButtonFistHome extends StatelessWidget {
  const RoudenButtonFistHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: RoundedButton(
        onPressed: () => Navigator.popAndPushNamed(context, RoutesApp.login),
        color: ThemeApp.primary,
        fontSize: size.height * 0.024,
        text: ConstApp.englishConst["fist_home_button"],
        paddingInside: size.height * 0.02,
      ),
    );
  }
}