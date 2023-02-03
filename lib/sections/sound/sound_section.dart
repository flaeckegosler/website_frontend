import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/components/section_title.dart';

class SoundSection extends StatefulWidget {
  @override
  _SoundSectionState createState() => _SoundSectionState();
}

class _SoundSectionState extends State<SoundSection> {
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
                  title: "Sound",
                  subTitle: "Nimm EinE KostprobE!",
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (MediaQuery.of(context).size.width > 1250)
                Column(
                  children: [
                    Container(
                      height: 250,
                      child: Row(
                        children: [
                          Expanded(
                            child: newSoundCard(
                              "Rothuusstäge 2020",
                              "assets/youtube_diadamas_2020.jpg",
                              "https://www.youtube.com/watch?v=2xE9i5t4mXQ",
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Expanded(
                            child: newSoundCard(
                              "Rothuusstäge 2019",
                              "assets/youtube_vampir_2019.jpg",
                              "https://www.youtube.com/watch?v=vlq1-nWLDh8&t",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      newSoundCard(
                          "Rothuusstäge 2020",
                          "assets/youtube_diadamas_2020.jpg",
                          "https://www.youtube.com/watch?v=2xE9i5t4mXQ"),
                      const SizedBox(
                        height: 15,
                      ),
                      newSoundCard(
                        "Rothuusstäge 2019",
                        "assets/youtube_vampir_2019.jpg",
                        "https://www.youtube.com/watch?v=vlq1-nWLDh8&t",
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect newSoundCard(
    String title,
    String assetImage,
    String youtubeLink,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          _launchURL(youtubeLink);
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                assetImage,
              ),
            ),
          ),
          child: Column(
            children: [
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
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Oswald',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 30, bottom: 22),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
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
