import 'package:flutter/material.dart';
import 'package:autoparts/widgets/widgets.dart';


class RoundedPasswordInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color colorIcon;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function()? onPressed;
  const RoundedPasswordInput({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.colorIcon,
    required this.obscureText,
    this.onChanged,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: colorIcon,
          ),
          suffixIcon: IconButton(
            splashRadius: 1,
            icon: Icon(
              Icons.visibility,
              color: colorIcon,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
