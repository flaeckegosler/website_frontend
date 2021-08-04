import 'package:flutter/material.dart';

class PersonPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 0),
          height: 650,
          // constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
          child: Image.asset(
            "assets/images/tambi_2020_vektor.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.only(
              right: 50,
              bottom: 110,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              // constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
              child: Image.asset(
                "assets/images/flaeckegosler_webseite_logo.png",
                fit: BoxFit.fitHeight,
                height: 125,
              ),
            ),
          ),
        )
      ],
    );
  }
}
