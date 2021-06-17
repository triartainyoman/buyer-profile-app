import 'package:buyer_profile_app/widgets/custom_button.dart';
import 'package:buyer_profile_app/widgets/input_field.dart';
import 'package:buyer_profile_app/widgets/reusable_back_button.dart';
import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';
import 'package:http/http.dart' as http;
import 'profile_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String id = 'change_password_screen';

  final Map data;
  ChangePasswordScreen({this.data});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerOldPassword = TextEditingController();
  TextEditingController controllerInputOldPassword = TextEditingController();
  TextEditingController controllerNewPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();

  final String url =
      'http://192.168.0.133/pemweb/furniture_api/editpassword.php';
  void editPassword() {
    try {
      http.post(
        Uri.parse(url),
        body: {
          "id": widget.data['id'],
          "password": controllerNewPassword.text,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  bool oldPasswordValidate() {
    if (controllerOldPassword.text == controllerInputOldPassword.text) {
      return true;
    } else {
      return false;
    }
  }

  bool newPasswordValidate() {
    if (controllerNewPassword.text == controllerConfirmPassword.text) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword() {
    if (controllerNewPassword.text != controllerOldPassword.text) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    controllerOldPassword.text = widget.data['password'];
    super.initState();
  }

  @override
  void dispose() {
    controllerConfirmPassword.clear();
    controllerConfirmPassword.clear();
    controllerInputOldPassword.clear();
    controllerOldPassword.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);
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
                SizedBox(
                  height: 17.0,
                ),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Old Password", style: kLabelTextStyle),
                        SizedBox(height: 12.0),
                        InputField(
                          obscureText: true,
                          controller: controllerInputOldPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Old password not match";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 36.0,
                        ),
                        Text("New Password", style: kLabelTextStyle),
                        SizedBox(height: 12.0),
                        InputField(
                          obscureText: true,
                          controller: controllerNewPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "New password not match";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 36.0,
                        ),
                        Text("Confirm New Password", style: kLabelTextStyle),
                        SizedBox(height: 12.0),
                        InputField(
                          obscureText: true,
                          controller: controllerConfirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "New password not match";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 66.0),
                        CustomButton(
                            text: "Change Password",
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                if (oldPasswordValidate()) {
                                  if (newPasswordValidate()) {
                                    if (validatePassword()) {
                                      editPassword();
                                      print(true);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return ProfileScreen();
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text("Password Success Updated"),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "The old password and the new password are the same",
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "New password not match",
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Old password not match",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            }),
                      ],
                    ),
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
