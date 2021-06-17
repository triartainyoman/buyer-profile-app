import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/reusable_back_button.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ChangeProfileImageScreen extends StatefulWidget {
  static String id = "changeprofileimage_screen";

  final Map data;
  ChangeProfileImageScreen({this.data});

  @override
  _ChangeProfileImageScreenState createState() =>
      _ChangeProfileImageScreenState();
}

class _ChangeProfileImageScreenState extends State<ChangeProfileImageScreen> {
  TextEditingController controllerImageURL = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controllerImageURL.text = widget.data['image_url'];
    super.initState();
  }

  @override
  void dispose() {
    controllerImageURL.clear();
    super.dispose();
  }

  final String url = 'http://192.168.0.133/pemweb/furniture_api/editimage.php';
  void editImageURL() {
    try {
      http.post(
        Uri.parse(url),
        body: {
          "id": widget.data['id'],
          "image_url": controllerImageURL.text,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data['image_url']);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.0),
                  Stack(
                    children: [
                      // Text(widget.data),
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
                    child: TextFormField(
                      controller: controllerImageURL,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                      style: kInputTextStyle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Profile image link cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 60.0),
                  CustomButton(
                    text: "Change Profile Image",
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        editImageURL();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ProfileScreen();
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Profile Image Updated"),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
