import 'package:buyer_profile_app/screens/profile_screen.dart';
import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/input_field.dart';
import 'package:buyer_profile_app/widgets/reusable_back_button.dart';
import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';
import 'package:http/http.dart' as http;

import '../buyer_data.dart';

class EditProfileScreen extends StatefulWidget {
  static String id = "edit_profile_screen";
  final Map data;
  EditProfileScreen({this.data});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  get kSubtitleTextStyle => null;
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  String selectedGender;

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
  void initState() {
    controllerName.text = widget.data['name'];
    controllerUsername.text = widget.data['username'];
    controllerPhoneNumber.text = widget.data['phone_number'];
    controllerEmail.text = widget.data['email'];
    selectedGender = widget.data['gender'];
    super.initState();
  }

  @override
  void dispose() {
    controllerName.clear();
    controllerUsername.clear();
    controllerPhoneNumber.clear();
    controllerEmail.clear();
    super.dispose();
  }

  final String url = 'http://192.168.0.133/pemweb/furniture_api/editdata.php';
  void editData() {
    try {
      http.post(Uri.parse(url), body: {
        "id": widget.data['id'],
        "name": controllerName.text,
        "username": controllerUsername.text,
        "gender": selectedGender,
        "phone_number": controllerPhoneNumber.text,
        "email": controllerEmail.text,
      }).then((value) {
        print(value.statusCode);
      });
    } catch (e) {
      print(e);
      print("gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: _formKey,
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
                  SizedBox(
                    height: 17.0,
                  ),
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
                        InputField(
                          obscureText: false,
                          controller: controllerName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 36.0),
                        Text("Username", style: kLabelTextStyle),
                        SizedBox(height: 11.0),
                        InputField(
                          obscureText: false,
                          controller: controllerUsername,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
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
                        InputField(
                          obscureText: false,
                          inputType: TextInputType.number,
                          controller: controllerPhoneNumber,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 36.0),
                        Text("Email", style: kLabelTextStyle),
                        SizedBox(height: 11.0),
                        InputField(
                          obscureText: false,
                          controller: controllerEmail,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 66.0,
                        ),
                        CustomButton(
                            text: "Save Changes",
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                editData();
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
                                    content: Text("Profile Data Updated"),
                                  ),
                                );
                              }
                            }),
                        SizedBox(height: 48.0),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
