import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({@required this.text, @required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Belum ditambahkan onpressd nya
      onPressed: () {},
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
