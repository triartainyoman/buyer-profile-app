import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart_screen';
  // const CartScreen({ Key? key }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Cart',
        style: kTitleTextStyle,
      )),
    );
  }
}
