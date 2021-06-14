import 'package:buyer_profile_app/screens/cart_screen.dart';
import 'package:buyer_profile_app/screens/change_password_screen.dart';
import 'package:buyer_profile_app/screens/edit_profile_screen.dart';
import 'package:buyer_profile_app/screens/forgot_password_screen.dart';
import 'package:buyer_profile_app/screens/home_screen.dart';
import 'package:buyer_profile_app/screens/login_screen.dart';
import 'package:buyer_profile_app/screens/nav.dart';
import 'package:buyer_profile_app/screens/notification_screen.dart';
import 'package:buyer_profile_app/screens/profile_screen.dart';
import 'package:buyer_profile_app/screens/search_screen.dart';
import 'package:buyer_profile_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture App',
      theme: ThemeData(),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
        Nav.id: (context) => Nav(),
        HomeScreen.id: (context) => HomeScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        CartScreen.id: (context) => CartScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
        EditProfileScreen.id: (context) => EditProfileScreen(),
        NotificationScreen.id: (context) => NotificationScreen(),
      },
    );
  }
}
