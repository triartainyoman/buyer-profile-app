import 'package:buyer_profile_app/screens/forgot_password_screen.dart';
import 'package:buyer_profile_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';
import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/custom_text_button.dart';
import 'package:buyer_profile_app/widgets/input_field.dart';
import 'nav.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                SizedBox(height: 105.0),
                Text("Hello Again!", style: kTitleTextStyle),
                Text("Welcome", style: kTitleTextStyle),
                Text("back", style: kTitleTextStyle),
                SizedBox(height: 76.0),
                Text("Email", style: kLabelTextStyle),
                SizedBox(height: 11.0),
                InputField(obscureText: false),
                SizedBox(height: 37.0),
                Text("Password", style: kLabelTextStyle),
                SizedBox(height: 11.0),
                InputField(obscureText: true),
                SizedBox(height: 37.0),
                CustomButton(
                  text: "Login",
                  onTap: () {
                    Navigator.pushNamed(context, Nav.id);
                  },
                ),
                SizedBox(height: 37.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      text: "Forgot your password?",
                      color: Colors.black,
                      onPress: () {
                        Navigator.pushNamed(context, ForgotPasswordScreen.id);
                      },
                    ),
                    CustomTextButton(
                      text: "Sign Up",
                      color: kMainColor,
                      onPress: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 105.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
