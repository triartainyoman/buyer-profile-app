import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Home',
        style: kTitleTextStyle,
      )),
    );
  }
}
