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
      // color: const Color.fromRGBO(230, 230, 230, 1),
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
                  title: "Sound",
                  subTitle: "Nimm eine Kostprobe!",
                  color: Color.fromRGBO(147, 90, 161, 1),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (MediaQuery.of(context).size.width > 750)
                Column(
                  children: [
                    SizedBox(
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
                Column(
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
              const SizedBox(
                height: 30,
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
        child: Container(
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
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.5, 2.5),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 1),
                        ),
                      ],
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
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(147, 90, 161, 1),
                      borderRadius: BorderRadius.all(
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
