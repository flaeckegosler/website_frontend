import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MitgliedWerden extends StatelessWidget {
  const MitgliedWerden({super.key});

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
                'Mitglied werden!',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'Gosler',
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text:
                          "Wenn auch du gerne mit uns die Fasnacht verbringen möchtest und dir bewusst bist, dass ein Gosler nicht nur Party macht sondern zuerst eine lange Zeit hart dafür arbeitet (ganz nach dem Motto: zuerst die Arbeit, dann das Vergnügen), so melde Dich doch bei unserem Präsident per ",
                    ),
                    TextSpan(
                      text: "E-Mail",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          launch(
                            "mailto:werde_ein@flaeckegosler.ch?subject=Mitglied%20werden%20Fläckegosler&body=Salüü%20Janick,",
                          );
                        }),
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "» Bewerbungsformular.pdf",
                  style: TextStyle(
                    shadows: const [
                      Shadow(offset: Offset(0, -5)),
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Theme.of(context).primaryColor,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() {
                      launch(
                        "https://api.flaeckegosler.ch/site/assets/files/1029/kandidatenformular24.pdf",
                      );
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
