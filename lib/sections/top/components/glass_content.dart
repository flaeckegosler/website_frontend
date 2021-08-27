import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website_frontend/constants.dart';

class GlassContent extends StatelessWidget {
  const GlassContent({
    required this.size,
  }) : super();

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 680,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          //   constraints:
          //     BoxConstraints(maxWidth: 1110, maxHeight: size.height * 0.7),
          width: 1110,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              SelectableText(
                "Guuggemusig",
                style: GoogleFonts.shadowsIntoLight(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SelectableText(
                "Fläckegosler \nRoteborg",
                style: GoogleFonts.shadowsIntoLight(
                  fontSize: 100,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  // height: 1.5,
                ),
              ),
              SelectableText(
                "Since 1989",
                style: GoogleFonts.shadowsIntoLight(
                  fontSize: 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
