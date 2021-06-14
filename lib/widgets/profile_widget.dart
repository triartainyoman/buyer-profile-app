import 'package:buyer_profile_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    @required this.imagePath,
    @required this.onClicked,
    @required this.height,
    @required this.width,
  });

  final String imagePath;
  final VoidCallback onClicked;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          buildCircle(
            all: 1.0,
            color: kMainColor,
            child: buildCircle(
              all: 3.0,
              color: Colors.white,
              child: buildCircle(
                all: 3.0,
                color: kSecondaryColor,
                child: buildImage(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: buildEditIcon(),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }

  Widget buildEditIcon() {
    return InkWell(
      onTap: onClicked,
      child: buildCircle(
        all: 2.0,
        color: Colors.white,
        child: buildCircle(
          all: 7.0,
          color: kMainColor,
          child: Icon(
            Icons.edit,
            size: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildCircle({
    @required Widget child,
    @required double all,
    @required Color color,
  }) {
    return ClipOval(
      child: Container(
        color: color,
        padding: EdgeInsets.all(all),
        child: child,
      ),
    );
  }
}
