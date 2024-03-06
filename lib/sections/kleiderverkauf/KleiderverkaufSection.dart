import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/components/section_title.dart';

class KleiderverkaufSection extends StatefulWidget {
  @override
  _KleiderverkaufSectionState createState() => _KleiderverkaufSectionState();
}

class _KleiderverkaufSectionState extends State<KleiderverkaufSection> {
  @override
  void initState() {
    super.initState();
  }

  TextStyle sujetFontProgramm = const TextStyle(
    color: Colors.white,
    fontSize: 13,
  );

  Color color2 = const Color.fromRGBO(172, 80, 48, 1);

  FittedBox getSujetRow(String text1, String anzahl) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 160,
            child: Text(
              text1,
              style: sujetFontProgramm,
            ),
          ),
          Text(
            "$anzahl  ",
            style: sujetFontProgramm,
          ),
        ],
      ),
    );
  }

  ClipRRect hose() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_kyoto.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hose",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/hose_kyoto.png"),
                  //repeat: ImageRepeat.repeat,
                  scale: 0.2,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect grind() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_kyoto_height.png"),
            fit: BoxFit.cover,
            scale: 0.2,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Grind",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/grind_kyoto.png"),
                  //repeat: ImageRepeat.repeat,
                  scale: 2.0,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect sujetIntro() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_kyoto_height.png"),
            fit: BoxFit.cover,
            scale: 0.2,
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              Image.asset(
                "assets/operation_kyoto_title.png",
              ),
              const Text(
                "Wir basteln jedes Jahr ein neues Sujet! Deshalb bieten wir unsere ehemaligen Gewänder zum Verkauf an! Unser Materialverwalter steht nach Vereinbarung gerne für eine Begutachtung vor Ort zur Verfügung!",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "E-Mail Kleiderverkauf",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() {
                      launch(
                        "mailto:goslermail@gmail.com?subject=Kleiderverkauf&body=Hallo%20Kay,",
                      );
                    }),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Nutzen Sie für andere Anfragen (Auftritt Expedition, Ständlianfrage etc.) das Kontaktformular im Footer!",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect details() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_kyoto.jpg"),
            fit: BoxFit.cover,
            scale: 0.2,
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Details zum Sujet:",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getSujetRow(
              'Anzahl Kleider:',
              '48. Stk.',
            ),
            getSujetRow(
              'Sujet bestehend aus:',
              '47x Jacke Mitglied',
            ),
            getSujetRow(
              '',
              '47x Hose Mitglied',
            ),
            getSujetRow(
              '',
              '47x Grind Mitglied',
            ),
            getSujetRow(
              '',
              '1x Tambourmajor (Kleid, Hose, Grind, Stab)',
            ),
            getSujetRow(
              'Preis',
              'Auf Anfrage!',
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect tambi() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_kyoto_height.png"),
            fit: BoxFit.cover,
            scale: 0.2,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Tambi",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
            Container(
              height: 600,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/tambi_kyoto.png"),
                  //repeat: ImageRepeat.repeat,
                  scale: 0.2,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect jacke() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_kyoto_height.png"),
            fit: BoxFit.cover,
            scale: 0.2,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Jacke",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/jacke_kyoto.png"),
                  //repeat: ImageRepeat.repeat,
                  scale: 0.2,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(230, 230, 230, 1),
      child: Align(
        child: Container(
          width: 1250,
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 10),
                child: SectionTitle(
                  title: "Kleiderverkauf",
                  subTitle: "Exklusive Sujets!",
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (MediaQuery.of(context).size.width < 1100)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      sujetIntro(),
                      const SizedBox(
                        height: 25,
                      ),
                      tambi(),
                      const SizedBox(
                        height: 25,
                      ),
                      grind(),
                      const SizedBox(
                        height: 25,
                      ),
                      jacke(),
                      const SizedBox(
                        height: 25,
                      ),
                      hose(),
                      const SizedBox(
                        height: 25,
                      ),
                      details(),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 500,
                      child: Column(
                        children: [
                          sujetIntro(),
                          const SizedBox(
                            height: 25,
                          ),
                          tambi(),
                          const SizedBox(
                            height: 25,
                          ),
                          details(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          grind(),
                          const SizedBox(
                            height: 25,
                          ),
                          jacke(),
                          const SizedBox(
                            height: 25,
                          ),
                          hose(),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
