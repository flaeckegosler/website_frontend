import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';

class GlassContent extends StatelessWidget {
  const GlassContent() : super();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          height: 580,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          //   constraints:
          //     BoxConstraints(maxWidth: 1110, maxHeight: size.height * 0.7),
          width: 1300,
          color: Colors.white.withOpacity(0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              SelectableText(
                "Guuggemusig",
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Impact',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SelectableText(
                "Fläckegosler \nRoteborg",
                style: TextStyle(
                  fontSize: 100.0,
                  fontFamily: 'Impact',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SelectableText(
                "Since 1989",
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Impact',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
