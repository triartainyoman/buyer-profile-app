import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';
import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/custom_text_button.dart';
import 'package:buyer_profile_app/widgets/input_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String id = "forgot_password_screen";

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Forgot Password"),
    );
  }
}
