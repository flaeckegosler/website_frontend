import 'package:flutter/material.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';
import 'package:website_frontend/sections/news/mobile/title_default.dart';

class Kleiderverkauf extends StatelessWidget {
  const Kleiderverkauf();

  Widget _buildTitelBild() {
    return const SizedBox(
      child: Image(
        image: AssetImage('assets/genesis.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildImageDescription({double leftPadding = 0}) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: leftPadding, right: 20),
      child: const Text(
        "Unser Sujet Kobolde des Winters!",
        style: TextStyle(color: Colors.grey, fontSize: 10),
      ),
    );
  }

  Widget _buildMainText({double leftPadding = 0}) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: leftPadding, right: 20),
      child: const Text(
        "Haben wir mit unseren Sujets euer Interesse geweckt? Unser Materialverwalter Manuel Mühlebach steht für weitere Auskünfte (Besichtigungstermin, Verkaufspreis etc.) gerne zur Verfügung.",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: MediaQuery.of(context).size.width > 500
            ? Column(
                children: [
                  Center(
                    child: SizedBox(
                      //  color: Colors.red,
                      width: 480,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 10),
                            child: SectionTitle(
                              title: "Kleiderverkauf",
                              subTitle: "Second Hand ist Nachhaltig!",
                              color: Color.fromRGBO(147, 90, 162, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _buildTitelBild(),
                          _buildImageDescription(),
                          Container(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 20),
                            child: const TitleDefault("Kobole des Winters"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 20),
                            child: const Text(
                              "Max. 17 Stk. Kleider (Jacke, Hose) mit Grind und Tambi-Kleid/Grind",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _buildMainText(),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const BottomBar(),
                ],
              )
            : ListView(
                children: <Widget>[
                  _buildTitelBild(),
                  _buildImageDescription(leftPadding: 20),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                    child: const TitleDefault("Kobole des Winters"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                    child: const Text(
                      "Max. 17 Stk. Kleider (Jacke, Hose) mit Grind und Tambi-Kleid/Grind",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildMainText(leftPadding: 20),
                ],
              ),
      ),
    );
  }
}
