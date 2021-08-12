import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/sections/top/components/logo_blur_box.dart';
import 'package:website_frontend/sections/top/components/menu.dart';
import 'package:website_frontend/sections/top/components/person_pic.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: 700,
      //constraints: const BoxConstraints(maxHeight: 700, minHeight: 700),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // fit: BoxFit.cover,
          image: AssetImage("assets/images/MUSTER_REPETIEREND.png"),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        // color: Colors.red,
        margin: const EdgeInsets.only(top: kDefaultPadding),
        width: 1200, //See class_content.dart
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: LogoAndBlurBox(size: size),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: PersonPic(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Menu(),
            ),
          ],
        ),
      ),
    );
  }
}
