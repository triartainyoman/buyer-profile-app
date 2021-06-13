import 'package:buyer_profile_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    @required this.text,
    @required this.color,
    @required this.onPress,
  });
  final String text;
  final Color color;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Belum ditambahkan onpressd nya
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}
