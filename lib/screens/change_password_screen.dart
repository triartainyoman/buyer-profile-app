import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/input_field.dart';
import 'package:buyer_profile_app/widgets/reusable_back_button.dart';
import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String id = 'change_password_screen';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                SizedBox(height: 61.0),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Text(
                            "Change Password",
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
                SizedBox(height: 17.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Text(
                        "Enter your old password and your new password down below",
                        style: kSubtitleTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 66.0),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Old Password", style: kLabelTextStyle),
                      SizedBox(height:12.0),
                      InputField(obscureText: true),

                      SizedBox(height: 36.0,),

                      Text("New Password", style: kLabelTextStyle),
                      SizedBox(height:12.0),
                      InputField(obscureText: true),

                      SizedBox(height: 36.0,),

                      Text("Confirm New Password", style: kLabelTextStyle),
                      SizedBox(height:12.0),
                      InputField(obscureText: true),

                      SizedBox(height:66.0),

                      CustomButton(
                        text: "Change Password", 
                        onTap: () {
                          Navigator.pop(context);
                        }
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}