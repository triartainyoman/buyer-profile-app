import 'package:flutter/material.dart';
import '../constants.dart';

class InputField extends StatelessWidget {
  InputField({@required this.obscureText, this.inputType});
  final bool obscureText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
        ),
        style: kInputTextStyle,
      ),
    );
  }
}
