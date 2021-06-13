import 'package:buyer_profile_app/widgets/reusable_back_button.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Text(
                            "Forgot Password",
                            style: kMenuTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ReusableBackButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 38.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter the email associated with your account and we'll send an email with intructions to reset your password.",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 66.0),
                    Text("Email", style: kLabelTextStyle),
                    SizedBox(height: 11.0),
                    InputField(obscureText: false),
                    SizedBox(height: 37.0),
                    CustomButton(
                      text: "Send Intructions",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
