import 'package:buyer_profile_app/screens/change_password_screen.dart';
import 'package:buyer_profile_app/screens/change_profile_image_screen.dart';
import 'package:buyer_profile_app/screens/login_screen.dart';
import 'package:buyer_profile_app/screens/edit_profile_screen.dart';
import 'package:buyer_profile_app/screens/shipping_address_screen.dart';
import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/custom_list_tile.dart';
import 'package:buyer_profile_app/widgets/profile_widget.dart';
import 'package:buyer_profile_app/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String url = 'http://10.0.2.2:8000/api/users/1';
  Future getData() async {
    try {
      var data = await http.get(Uri.parse(url));
      var jsonData = json.decode(data.body);
      print(jsonData);
      return jsonData;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Text("Loading..."),
                  );
                } else {
                  return Column(
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
                        imagePath: snapshot.data['data']['image_url'],
                        onClicked: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   ChangeProfileImageScreen.id,
                          //   arguments: ChangeProfileImageScreen(
                          //     data: snapshot.data['data'],
                          //   ),
                          // );
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ChangeProfileImageScreen(
                              data: snapshot.data['data'],
                            );
                          }));
                        },
                        width: 130.0,
                        height: 130.0,
                      ),
                      SizedBox(height: 33.0),
                      Center(
                        child: Text(
                          snapshot.data['data']['name'],
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
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return EditProfileScreen(
                              data: snapshot.data['data'],
                            );
                          }));
                        },
                      ),
                      SizedBox(height: 27.0),
                      CustomListTile(
                        image: 'assets/icons/icon_notification.png',
                        text: "Notification",
                        onTap: () {
                          Navigator.pushNamed(context, NotificationScreen.id);
                        },
                      ),
                      SizedBox(height: 27.0),
                      CustomListTile(
                        image: 'assets/icons/icon_address.png',
                        text: "Shipping Address",
                        onTap: () {
                          Navigator.pushNamed(
                              context, ShippingAddressScreen.id);
                        },
                      ),
                      SizedBox(height: 27.0),
                      CustomListTile(
                        image: 'assets/icons/icon_lock.png',
                        text: "Change Password",
                        onTap: () {
                          Navigator.pushNamed(context, ChangePasswordScreen.id);
                        },
                      ),
                      SizedBox(height: 58.0),
                      CustomButton(
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        text: 'Sign Out',
                      ),
                      SizedBox(height: 61.0),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
