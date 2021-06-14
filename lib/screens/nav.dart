import 'package:buyer_profile_app/constants.dart';
import 'package:buyer_profile_app/screens/cart_screen.dart';
import 'package:buyer_profile_app/screens/home_screen.dart';
import 'package:buyer_profile_app/screens/profile_screen.dart';
import 'package:buyer_profile_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Nav extends StatefulWidget {
  static String id = 'nav';
  // const Nav({ Key? key }) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List _widgetOption = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            activeColor: kMainColor,
            inactiveColor: kMainColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            activeColor: kMainColor,
            inactiveColor: kMainColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Cart"),
            activeColor: kMainColor,
            inactiveColor: kMainColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text("Profile"),
            activeColor: kMainColor,
            inactiveColor: kMainColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
