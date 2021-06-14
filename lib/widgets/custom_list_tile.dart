import 'package:flutter/material.dart';
import 'package:buyer_profile_app/constants.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    @required this.image,
    @required this.text,
    @required this.onTap,
  });

  final String text;
  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 24.0),
          Text(
            text,
            style: kLabelTextStyle,
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ],
      ),
    );
  }
}

// ListTile(
//       leading: Image.asset(image),
//       title: Text(
//         text,
//         style: kLabelTextStyle,
//       ),
//       onTap: onTap,
//       trailing: Icon(
//         Icons.arrow_forward_ios_outlined,
//       ),
//     )
