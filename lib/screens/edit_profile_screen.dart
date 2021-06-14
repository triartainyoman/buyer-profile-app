import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/input_field.dart';
import 'package:buyer_profile_app/widgets/reusable_back_button.dart';
import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';

import '../buyer_data.dart';

class EditProfileScreen extends StatefulWidget {
  static String id = "edit_profile_screen";

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  get kSubtitleTextStyle => null;

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
                            "Edit Profile",
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
                        "Change the field bellow and  using the save button to update your profile",
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

                    Text("Name", style: kLabelTextStyle),
                    SizedBox(height: 11.0),
                    InputField(obscureText: false),

                    SizedBox(height: 36.0),

                    Text("Username", style: kLabelTextStyle),
                    SizedBox(height: 11.0),
                    InputField(obscureText: false),

                    SizedBox(height: 36.0),

                    Text("Gender", style: kLabelTextStyle),
                    SizedBox(height: 11.0),
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

                    SizedBox(height: 36.0),

                    Text("Phone Number", style: kLabelTextStyle),
                    SizedBox(height: 11.0),
                    InputField(obscureText: false),

                    SizedBox(height: 36.0),

                    Text("Email", style: kLabelTextStyle),
                    SizedBox(height: 11.0),
                    InputField(obscureText: false),

                    SizedBox(height: 66.0,),

                    CustomButton(
                      text: "Save Changes", 
                      onTap: () {
                        Navigator.pop(context);
                      }
                    ),

                    SizedBox(height: 48.0),

                    ],
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}