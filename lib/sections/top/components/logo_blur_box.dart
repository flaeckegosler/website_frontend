import 'package:flutter/material.dart';
import 'package:website_frontend/sections/top/components/glass_content.dart';

class LogoAndBlurBox extends StatelessWidget {
  const LogoAndBlurBox() : super();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Image.asset("assets/flaeckegosler.png"),
        // const Spacer(),
        GlassContent(),
        // Spacer(flex: 3),
      ],
    );
  }
}
