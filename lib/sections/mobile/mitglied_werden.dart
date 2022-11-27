import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/provider/color_singleton.dart';

class MitgliedWerden extends StatelessWidget {
  const MitgliedWerden({Key? key}) : super(key: key);

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
                              "mailto:werde_ein@flaeckegosler.ch?subject=Mitglied%20werden%20Fläckegosler&body=Salüü%20Janick,");
                        }),
                    ),
                    TextSpan(text: "."),
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
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -5))
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorSingleton().mainTheme,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() {
                      launch(
                          "https://test.flaeckegosler.ch/site/assets/files/1029/kandidatenformular23.pdf");
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
