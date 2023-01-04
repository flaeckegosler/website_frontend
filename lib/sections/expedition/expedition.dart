import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/sections/mobile/countdown.dart';

class ExpeditionSection extends StatefulWidget {
  @override
  _ExpeditionSectionState createState() => _ExpeditionSectionState();
}

class _ExpeditionSectionState extends State<ExpeditionSection> {
  @override
  void initState() {
    super.initState();
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(230, 230, 230, 1),
      child: Align(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          width: 1250,
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 10),
                child: SectionTitle(
                  title: "Expedition",
                  subTitle: "Unser Fasnachtsfest!",
                  color: Color.fromRGBO(147, 90, 161, 1),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Countdown(),
              Column(
                children: [
                  SizedBox(
                    child: expeditionCard(
                      "7. Januar 2023",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _launchURL(
                      "https://eventfrog.ch/de/p/fasnacht-fasching-karneval/party/expedition-2023-6986362871014655249.html",
                    );
                  },
                  child: const Text(
                    "Tickets kaufen!",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect expeditionCard(
    String title,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => launch("https://expedition-rothenburg.ch/"),
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: MediaQuery.of(context).size.width < 1250
                  ? const AssetImage(
                      "assets/expedition.png",
                    )
                  : const AssetImage(
                      "assets/expedition_2023.png",
                    ),
            ),
          ),
          child: Column(
            children: [
              if (MediaQuery.of(context).size.width < 1250)
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 4.0,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Oswald',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              else
                const SizedBox(),
              SizedBox(
                height: MediaQuery.of(context).size.width < 1250 ? 130 : 380,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 30, bottom: 22),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
