import 'package:flutter/material.dart';
import 'package:website_frontend/mobile/countdown.dart';

class PersonPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 60),
          child: SizedBox(
            height: 550,
            // constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
            /*    child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/webseite_mann_kyoto.png",
                fit: BoxFit.fitHeight,
              ),
            ),*/
          ),
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
        )
      ],
    );
  }
}
