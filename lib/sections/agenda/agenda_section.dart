import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website_frontend/components/section_title.dart';

class AgendaSection extends StatefulWidget {
  @override
  _AgendaSectionState createState() => _AgendaSectionState();
}

class _AgendaSectionState extends State<AgendaSection> {
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
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 10),
                child: SectionTitle(
                  title: "Agenda",
                  subTitle: "Komm vorbei!",
                  color: Color.fromRGBO(147, 90, 161, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Here comes the buttons
              Container(
                height: 700,
                width: 1250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TimelineTile(
                      indicatorStyle: const IndicatorStyle(
                          color: Color.fromRGBO(147, 90, 161, 1),
                          height: 15,
                          width: 15),
                      isFirst: true,
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 80),
                      endChild: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Samstag, 7. Januar 2023"),
                            Text("Expedition, Roteborg")
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: const IndicatorStyle(
                          color: Color.fromRGBO(147, 90, 161, 1),
                          height: 15,
                          width: 15),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      endChild: const SizedBox(height: 80),
                      startChild: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Samstag, 14. Januar 2023"),
                            Text("Inthronisation, Roteborg &"),
                            Text("Suugerguggete, Emmenbrücke")
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: const IndicatorStyle(
                          color: Color.fromRGBO(147, 90, 161, 1),
                          height: 15,
                          width: 15),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 80),
                      endChild: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Samstag, 21. Januar 2023"),
                            Text("Räbibock, Hochdorf")
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: const IndicatorStyle(
                          color: Color.fromRGBO(147, 90, 161, 1),
                          height: 15,
                          width: 15),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      endChild: const SizedBox(height: 80),
                      startChild: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Freitag, 27. Januar 2023"),
                            Text("5-Liter-Humpen (interner Anlass)")
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: const IndicatorStyle(
                          color: Color.fromRGBO(147, 90, 161, 1),
                          height: 15,
                          width: 15),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 80),
                      endChild: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Sonntag, 29. Januar 2023"),
                            Text("Öffentliche Probe, Roteborg")
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: const IndicatorStyle(
                          color: Color.fromRGBO(147, 90, 161, 1),
                          height: 15,
                          width: 15),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      endChild: const SizedBox(height: 80),
                      startChild: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Samstag, 4. Februar 2023"),
                            Text("Hammerball, Hünenberg")
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: const IndicatorStyle(
                          color: Color.fromRGBO(147, 90, 161, 1),
                          height: 15,
                          width: 15),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 80),
                      endChild: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Freitag, 10. Februar 2023"),
                            Text("Igüüglete, Roteborg")
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: const IndicatorStyle(
                          color: Color.fromRGBO(147, 90, 161, 1),
                          height: 15,
                          width: 15),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      isLast: true,
                      endChild: const SizedBox(height: 80),
                      startChild: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Samstag, 11. Februar 2023"),
                            Text("Waldhötteball, Meierskappel")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
