import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KleiderKaufenBox extends StatelessWidget {
  const KleiderKaufenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      //  height: 250,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 15,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Zu verkaufen!',
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
                          "Wir basteln jedes Jahr ein neues Sujet! Deshalb bieten wir unsere ehemaligen Gewänder zum Verkauf an! Die Kleider sind in einem guten Zustand. Unser Materialverwalter steht nach Vereinbarung gerne für eine Begutachtung vor Ort zur Verfügung!",
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
                    decorationColor: Theme.of(context).primaryColor,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() {
                      GoRouter.of(context).push('/kleiderverkauf');
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
