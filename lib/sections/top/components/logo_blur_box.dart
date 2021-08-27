import 'package:flutter/material.dart';
import 'package:website_frontend/sections/top/components/glass_content.dart';

class LogoAndBlurBox extends StatelessWidget {
  const LogoAndBlurBox({
    required this.size,
  }) : super();

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.asset("assets/flaeckegosler.png"),
        // const Spacer(),
        GlassContent(size: size),
        // Spacer(flex: 3),
      ],
    );
  }
}
