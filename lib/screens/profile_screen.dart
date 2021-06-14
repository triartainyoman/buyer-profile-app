import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/custom_list_tile.dart';
import 'package:buyer_profile_app/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                Center(
                  child: Text(
                    "Profile",
                    style: kMenuTextStyle,
                  ),
                ),
                SizedBox(height: 35.0),
                ProfileWidget(
                  imagePath: 'https://www.w3schools.com/howto/img_avatar.png',
                  onClicked: () {},
                  width: 130.0,
                  height: 130.0,
                ),
                SizedBox(height: 33.0),
                Center(
                  child: Text(
                    "I Nyoman Triarta",
                    style: kMenuTextStyle,
                  ),
                ),
                Center(
                  child: Text(
                    "Buyer",
                    style: kLabelTextStyle.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 58.0),
                CustomListTile(
                  image: 'assets/icons/icon_edit_profile.png',
                  text: "Edit Profile",
                  onTap: () {},
                ),
                SizedBox(height: 27.0),
                CustomListTile(
                  image: 'assets/icons/icon_notification.png',
                  text: "Notification",
                  onTap: () {},
                ),
                SizedBox(height: 27.0),
                CustomListTile(
                  image: 'assets/icons/icon_address.png',
                  text: "Shipping Address",
                  onTap: () {},
                ),
                SizedBox(height: 27.0),
                CustomListTile(
                  image: 'assets/icons/icon_lock.png',
                  text: "Change Password",
                  onTap: () {},
                ),
                SizedBox(height: 58.0),
                CustomButton(
                  onTap: () {},
                  text: 'Sign Out',
                ),
                SizedBox(height: 61.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
