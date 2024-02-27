import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/components/section_title.dart';

class OktoberfestSection extends StatefulWidget {
  @override
  _OktoberfestSectionState createState() => _OktoberfestSectionState();
}

class _OktoberfestSectionState extends State<OktoberfestSection> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        _confettiController.play();
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
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
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 10),
                child: SectionTitle(
                  title: "Oktoberfest",
                  subTitle: "Unser Gaudi!",
                  fontFamily: "Gosler",
                  fontWeight: FontWeight.w200,
                  color: Color.fromRGBO(40, 145, 210, 1),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  SizedBox(
                    child: oktoberfestCard(
                      "21. September 2024",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      numberOfParticles: 100,
                      gravity: 0.01,
                      colors: const [
                        Colors.white,
                        Colors.blue,
                        Colors.blue,
                        //  Colors.purple
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container oktoberfestCard(String title) {
    return Container(
      padding: (MediaQuery.of(context).size.width < 1250)
          ? const EdgeInsets.symmetric(horizontal: 10)
          : EdgeInsets.zero,
      child: InkWell(
        onTap: () => launch("https://rothenburger-oktoberfest.ch/"),
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                width: double.maxFinite,
                color: const Color(0xFFF7F4E3),
                child: Row(
                  children: [
                    const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            top: 5.0,
                            bottom: 5.0,
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 30,
                                fontFamily: 'Gosler',
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xFFF7F4E3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 500,
                      maxWidth: MediaQuery.of(context).size.width - 20.0,
                    ),
                    child: Image.asset(
                      "assets/Oktoberfest_Poster.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                width: double.maxFinite,
                color: const Color(0xFFF7F4E3),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            top: 5.0,
                            bottom: 5.0,
                          ),
                          child: Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Mehr Infos",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Gosler',
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.black,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
