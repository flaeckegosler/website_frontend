import 'package:flutter/material.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SoundSection extends StatefulWidget {
  @override
  _SoundSectionState createState() => _SoundSectionState();
}

class _SoundSectionState extends State<SoundSection> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    const url = 'https://www.youtube.com/watch?v=vlq1-nWLDh8';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      // color: const Color.fromRGBO(230, 230, 230, 1),
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
                  title: "Sound",
                  subTitle: "Nimm eine Kostprobe!",
                  color: Color.fromRGBO(147, 90, 161, 1),
                ),
              ),
              SizedBox(
                height: 500,
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controlsTimeOut: Duration(seconds: 10),
                    controller: controller,
                  ),
                  builder: (context, player) => Container(
                    child: player,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
