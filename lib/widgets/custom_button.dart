import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.text, @required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Belum ditambahkan ontap nya
      onTap: onTap,
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
