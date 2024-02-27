import 'package:flutter/material.dart';
import 'package:website_frontend/mobile/countdown.dart';

class PersonPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 200, bottom: 150),
          child: Container(
            height: 950,
            width: 400,
            //constraints: const BoxConstraints(maxWidth: 1039, maxHeight: 1060),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/website_phoenix.png",
              ),
            ),
          ),
          // ),
        ),
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.only(
              right: 100,
              bottom: 110,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              // constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
              child: Countdown(),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.only(
              right: 50,
              bottom: 160,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              // constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
              child: Image.asset(
                "assets/flaeckegosler_webseite_logo.png",
                fit: BoxFit.fitHeight,
                height: 125,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
