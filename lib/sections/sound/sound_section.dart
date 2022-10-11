import 'package:flutter/material.dart';
import 'package:website_frontend/components/expedition_widget.dart';
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
            children: const [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 10),
                child: SectionTitle(
                  title: "Sound",
                  subTitle: "Nimm eine Kostprobe!",
                  color: Color.fromRGBO(147, 90, 161, 1),
                ),
              ),
              SizedBox(
                height: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
