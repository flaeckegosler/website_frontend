import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/provider/sound_provider.dart';

class SoundSection extends StatefulWidget {
  @override
  _SoundSectionState createState() => _SoundSectionState();
}

class _SoundSectionState extends State<SoundSection> {
  bool _isLoading = false;

  //Fetch all Listings
  Future fetchSoundItemsList() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<SoundProvider>(context, listen: false).fetchSoundItems();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchSoundItemsList();
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
              Column(
                children: _isLoading
                    ? [
                        SizedBox(
                          height: 300,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ]
                    : [
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio:
                              MediaQuery.of(context).size.width > 1250 &&
                                      Provider.of<SoundProvider>(context)
                                          .isDivisibleByThree()
                                  ? 1.5
                                  : 2.0,
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 1250 &&
                                      Provider.of<SoundProvider>(context)
                                          .isDivisibleByThree()
                                  ? 3
                                  : (MediaQuery.of(context).size.width > 1250
                                      ? 2
                                      : 1),
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                          shrinkWrap: true,
                          children: Provider.of<SoundProvider>(context)
                              .allSoundItems
                              .map((soundItem) {
                            return newSoundCard(
                              soundItem.soundTitle,
                              soundItem.image,
                              soundItem.soundUrl,
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding newSoundCard(
    String title,
    String assetImage,
    String youtubeLink,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            _launchURL(youtubeLink);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://api.flaeckegosler.ch/$assetImage",
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
                const Expanded(
                  child: SizedBox(),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.only(right: 30, bottom: 22),
                    child: DecoratedBox(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
