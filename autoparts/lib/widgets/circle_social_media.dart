import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleSocialMedia extends StatelessWidget {
  final String assetImage;
  final Color colorCircle;
  final Color colorIcon;
  final Function()? onTap;
  final double padding;
  final double borderWidth;

  const CircleSocialMedia({
    Key? key,
    required this.assetImage,
    this.colorCircle = Colors.black,
    this.onTap,
    this.padding = 20,
    this.borderWidth = 2,
    this.colorIcon = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth,
            color: colorCircle,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          assetImage,
          width: 20,
          height: 20,
          color: colorIcon,
        ),
      ),
    );
  }
}
