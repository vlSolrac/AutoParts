import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color color;
  final double fontSize;
  final Color textColor;
  final double paddingInside;
  const RoundedButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.color,
    this.fontSize = 10,
    this.textColor = Colors.white,
    required this.paddingInside,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: MaterialButton(
          onPressed: onPressed,
          color: color,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: paddingInside),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
