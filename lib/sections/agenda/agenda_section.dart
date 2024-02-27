import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/agenda_item.dart';
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

  List<TimelineTile> buildTimelineTiles(List<AgendaItem> agendaItems) {
    final List<TimelineTile> timelineTiles = [];

    Widget buildContentContainer(
      String dateDisplay,
      String location,
      bool isOdd,
    ) {
      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment:
              isOdd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                dateDisplay,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(location),
            ),
          ],
        ),
      );
    }

    for (int i = 0; i < agendaItems.length; i++) {
      final AgendaItem item = agendaItems[i];
      final bool isOdd = i % 2 == 0;

      timelineTiles.add(
        TimelineTile(
          indicatorStyle: IndicatorStyle(
            color: Theme.of(context).primaryColor,
            height: 15,
            width: 15,
          ),
          isFirst: i == 0,
          isLast: i == agendaItems.length - 1,
          beforeLineStyle: const LineStyle(thickness: 2),
          alignment: TimelineAlign.center,
          startChild: isOdd
              ? buildContentContainer(
                  item.agendaDate,
                  item.agendaLocation,
                  isOdd,
                )
              : const SizedBox(height: 60),
          endChild: !isOdd
              ? buildContentContainer(
                  item.agendaDate,
                  item.agendaLocation,
                  isOdd,
                )
              : const SizedBox(height: 60),
        ),
      );
    }

    return timelineTiles;
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
                  subTitle: "Komm vorbei!",
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
                      : buildTimelineTiles(
                          Provider.of<AgendaProvider>(context, listen: false)
                              .allAgendaItems,
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
