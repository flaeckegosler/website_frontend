import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/provider/color_singleton.dart';

class GoennerWerden extends StatelessWidget {
  const GoennerWerden({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 250,
      color: const Color.fromRGBO(230, 230, 230, 1),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
            border: Border.all(
              color: ColorSingleton().mainTheme,
              width: 15,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gönner werden!',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Gosler',
                ),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Musikalische Unterhaltung und ein feines Z’nacht, inkl. bekannter Küchenmannschaft und langjährig geschultem, “ISO-zertifiziertem” Personal an Flaschenöffner und Korkenzieher, lassen keine Wünsche offen. Und das Ganze hat noch den positiven Nebeneffekt, dass du einen äusserst junggebliebenen, innovativen Verein in seinem Tun unterstützt.",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "» Mehr erfahren!",
                  style: TextStyle(
                    shadows: const [
                      Shadow(
                        offset: Offset(0, -5),
                      ),
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorSingleton().mainTheme,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() {
                      GoRouter.of(context).push('/goenner');
                    }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
