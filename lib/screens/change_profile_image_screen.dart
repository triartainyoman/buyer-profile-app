import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/reusable_back_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChangeProfileImageScreen extends StatefulWidget {
  static String id = "changeprofileimage_screen";

  @override
  _ChangeProfileImageScreenState createState() =>
      _ChangeProfileImageScreenState();
}

class _ChangeProfileImageScreenState extends State<ChangeProfileImageScreen> {
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
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "Change",
                                style: kMenuTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                child: Text(
                              "Profile Image",
                              style: kMenuTextStyle,
                              textAlign: TextAlign.center,
                            ))
                          ],
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
                SizedBox(
                  height: 17.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter your new profile image link down below",
                        style: kSubtitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80.0),
                Text(
                  "Profile Image Link",
                  style: kLabelTextStyle,
                ),
                SizedBox(height: 12.0),
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                    maxLines: 8,
                    style: kInputTextStyle,
                  ),
                ),
                SizedBox(height: 60.0),
                CustomButton(
                  text: "Change Profile Image",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
