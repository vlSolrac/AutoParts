import 'package:flutter/material.dart';
import 'package:autoparts/themes/themes.dart';

class HeaderFistHome extends StatelessWidget {
  const HeaderFistHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Autoparts",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.08),
          ),
          SizedBox(height: size.height * 0.01),
          SizedBox(
            width: size.width * 0.7,
            child: Text(
              ConstApp.englishConst["fist_home"],
              style: TextStyle(fontSize: size.width * 0.04),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
