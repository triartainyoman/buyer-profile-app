import 'package:flutter/material.dart';
import '../constants.dart';

class InputField extends StatelessWidget {
  InputField({
    @required this.obscureText,
    this.inputType,
    this.controller,
    this.initialValue,
    this.onChange,
  });
  final bool obscureText;
  final TextInputType inputType;
  final TextEditingController controller;
  final String initialValue;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: inputType,
        obscureText: obscureText,
        onChanged: onChange,
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
