import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Search',
        style: kTitleTextStyle,
      )),
    );
  }
}
