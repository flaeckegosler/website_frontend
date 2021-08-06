import 'package:flutter/material.dart';
import 'package:website_frontend/sections/topSection/components/glass_content.dart';

class LogoAndBlurBox extends StatelessWidget {
  const LogoAndBlurBox({
    required this.size,
  }) : super();

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.asset("assets/images/flaeckegosler.png"),
        Spacer(),
        GlassContent(size: size),
        // Spacer(flex: 3),
      ],
    );
  }
}
