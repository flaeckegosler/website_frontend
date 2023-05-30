import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/sections/top/components/logo_blur_box.dart';
import 'package:website_frontend/sections/top/components/menu.dart';
import 'package:website_frontend/sections/top/components/person_pic.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 600,
      //constraints: const BoxConstraints(maxHeight: 700, minHeight: 700),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/background_kyoto.jpg"),
          //  repeat: ImageRepeat.repeatX,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        // color: Colors.red,
        margin: const EdgeInsets.only(top: kDefaultPadding),
        width: 1250, //See class_content.dart
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: const LogoAndBlurBox(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                width: 450,
                child: PersonPic(),
              ),
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
