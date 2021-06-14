import 'package:buyer_profile_app/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:buyer_profile_app/constants.dart';
import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/custom_text_button.dart';
import 'package:buyer_profile_app/widgets/input_field.dart';
import 'package:buyer_profile_app/buyer_data.dart';

enum Gender {
  Male,
  Female,
}

class SignUpScreen extends StatefulWidget {
  static String id = "sign_up_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedGender = 'Male';

  DropdownButton<String> genderDropdown() {
    return DropdownButton(
      isExpanded: true,
      value: selectedGender,
      underline: SizedBox(),
      items: genderList
          .map(
            (gender) => DropdownMenuItem(
              child: Text(
                gender,
                style: kInputTextStyle,
              ),
              value: gender,
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedGender = value;
          print(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 105.0),
                Text("Hello!", style: kTitleTextStyle),
                Text("Sign Up to", style: kTitleTextStyle),
                Text("get started", style: kTitleTextStyle),
                SizedBox(height: 76.0),
                // Avatar
                ProfileWidget(
                  imagePath: 'https://www.w3schools.com/howto/img_avatar.png',
                  onClicked: () {},
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(height: 46.0),
                Text("Name", style: kLabelTextStyle),
                SizedBox(height: 11),
                InputField(obscureText: false),
                SizedBox(height: 36),
                Text("Username", style: kLabelTextStyle),
                SizedBox(height: 11),
                InputField(obscureText: false),
                SizedBox(height: 36),
                Text("Gender", style: kLabelTextStyle),
                SizedBox(height: 11),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  width: double.infinity,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: genderDropdown(),
                ),
                SizedBox(height: 36),
                Text("Phone Number", style: kLabelTextStyle),
                SizedBox(height: 11),
                InputField(
                  obscureText: false,
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 36),
                Text("Email", style: kLabelTextStyle),
                SizedBox(height: 11.0),
                InputField(obscureText: false),
                SizedBox(height: 36.0),
                Text("Password", style: kLabelTextStyle),
                SizedBox(height: 11.0),
                InputField(obscureText: true),
                SizedBox(height: 36.0),
                Text("Password", style: kLabelTextStyle),
                SizedBox(height: 11.0),
                InputField(obscureText: true),
                SizedBox(height: 37.0),
                CustomButton(
                  text: "Sign Up",
                  onTap: () {
                    print("Berhasil");
                  },
                ),
                SizedBox(height: 37.0),
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomTextButton(
                      text: "Login",
                      color: kMainColor,
                      onPress: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    )
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
