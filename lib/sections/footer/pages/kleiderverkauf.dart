import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:website_frontend/sections/news/mobile/title_default.dart';

class Kleiderverkauf extends StatelessWidget {
  const Kleiderverkauf();

  Widget _buildTitelBild() {
    return const SizedBox(
      height: 300,
      child: Image(
        image: AssetImage('assets/genesis.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildImageDescription() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 20),
      child: const Text(
        "Unser Sujet Kobolde des Winters!",
        style: TextStyle(color: Colors.grey, fontSize: 10),
      ),
    );
  }

  Widget _buildMainText() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Html(
        data:
            "Haben wir mit unseren Sujets euer Interesse geweckt? Unser Materialverwalter Manuel Mühlebach steht für weitere Auskünfte (Besichtigungstermin, Verkaufspreis etc.) gerne zur Verfügung.",
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
              child: const TitleDefault("Kobole des Winters"),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: Html(
                data:
                    "<b>Max. 17 Stk. Kleider (Jacke, Hose) mit Grind und Tambi-Kleid/Grind</b>",
              ),
            ),
            _buildMainText(),
          ],
        ),
      ),
    );
  }
}
