import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/provider/agenda_provider.dart';

class AgendaSection extends StatefulWidget {
  @override
  _AgendaSectionState createState() => _AgendaSectionState();
}

class _AgendaSectionState extends State<AgendaSection> {
  bool _isLoading = false;

  //Fetch all Listings
  Future fetchAgendaList() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<AgendaProvider>(context, listen: false)
        .fetchAgendaItems();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchAgendaList();
    super.initState();
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
                  title: "Agenda",
                  subTitle: "Komm vorbEi!",
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Here comes the buttons
              SizedBox(
                height: 700,
                width: 1250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      isFirst: true,
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 60),
                      endChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Freitag, 24. März",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Mitgliederversammlung, Roteborg"),
                            )
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      endChild: const SizedBox(height: 60),
                      startChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Samstag, 6. Mai",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Generalversammlung, Roteborg"),
                            ),
                            /* FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Suugerguggete, Emmenbrücke"),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 60),
                      endChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Freitag 12. - Sonntag 14. Mai",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Frühlingsausflug"),
                            )
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      endChild: const SizedBox(height: 60),
                      startChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Freitag, 2. Juni",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Sujetwahl"),
                            )
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 60),
                      endChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Samstag, 10. Juni",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Auftritt Städtetreffen, Roteborg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      endChild: const SizedBox(height: 60),
                      startChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Freitag, 7. Juli",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("BCH Stamm"),
                            )
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 60),
                      endChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Samstag, 5. August",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Gosler Wandertag & BCH Stamm"),
                            )
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      endChild: const SizedBox(height: 60),
                      startChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Freitag, 1. September",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("BCH Stamm"),
                            )
                          ],
                        ),
                      ),
                    ),
                    TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        color: Theme.of(context).primaryColor,
                        height: 15,
                        width: 15,
                      ),
                      isLast: true,
                      beforeLineStyle: const LineStyle(thickness: 2),
                      alignment: TimelineAlign.center,
                      startChild: const SizedBox(height: 60),
                      endChild: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Sonntag, 23. September",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text("Start Probesaison"),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
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
