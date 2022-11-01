import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/sections/news/mobile/title_default.dart';

class Goenner extends StatelessWidget {
  const Goenner();

  Widget _buildTitelBild() {
    return const SizedBox(
      height: 300,
      child: Image(
        image: AssetImage('assets/goenner.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildImageDescription() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: const Text(
        "Bild: Der legendäre Gönnerauftritts der Fasnacht 2020!",
        style: TextStyle(color: Colors.grey, fontSize: 10),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Falls Du all diese Fragen mit “Ja” beantworten kannst/musst, haben wir für dich die ultimative Lösung parat. \n",
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Den Gönneranlass am Fasnachts-Freitag der Fläckegosler Roteborg! \n",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Musikalische Unterhaltung und ein feines Z’nacht, inkl. bekannter Küchenmannschaft und langjährig geschultem, “ISO-zertifiziertem” Personal an Flaschenöffner und Korkenzieher, lassen keine Wünsche offen. Und das Ganze hat noch den positiven Nebeneffekt, dass du einen äusserst junggebliebenen, innovativen Verein in seinem Tun unterstützt.",
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Für sage und schreibe CHF 50.- pro Jahr und Person, oder für noch unglaublichere CHF 100.- wenn Du dein Ehepartner, deine Freundin oder was auch immer mitschleppst, bist Du mit dabei. Keine Frage, ein Dampfschiff kostet einen Batzen oder zwei mehr!",
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text:
                      "Falls es dich nun in den Fingern juckt, melde dich direkt bei ",
                ),
                TextSpan(
                  text: "Joanna Zemp per E-Mail",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() {
                      launch(
                          "mailto:joannazemp+gosler@gmail.com?subject=Gönner%20werden%20Fläckegosler&body=Hallo%20Joanna,");
                    }),
                ),
                TextSpan(
                    text:
                        ", damit wir dich mit näheren Infos und dem Einzahlungsschein ausrüsten können. Vielen Dank!"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
        ),
        body: ListView(
          children: <Widget>[
            _buildTitelBild(),
            _buildImageDescription(),
            Container(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: const TitleDefault(
                "Mittendrin oder zumindest ganz Nahe dran!",
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: const Text(
                "Hörst Du gerne gepflegte, kakaphonische Klänge? Bist Du eine Person, die nicht nein sagen kann, wenn es darum geht, ein reichhaltiges Essen in guter Gesellschaft zu geniessen? Ist deine Lachmuskulatur für den Härtetest bereit?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildMainText(),
          ],
        ),
      ),
    );
  }
}
