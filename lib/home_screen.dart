import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website_frontend/mobile/countdown.dart';
import 'package:website_frontend/mobile/goenner_werden.dart';
import 'package:website_frontend/mobile/kleider_kaufen_box.dart';
import 'package:website_frontend/mobile/mitglied_werden.dart';
import 'package:website_frontend/provider/scroll_singleton.dart';
import 'package:website_frontend/sections/AppSection.dart';
import 'package:website_frontend/sections/agenda/agenda_section.dart';
import 'package:website_frontend/sections/expedition/expedition.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';
import 'package:website_frontend/sections/gallery/gallery_section.dart';
import 'package:website_frontend/sections/kleiderverkauf/KleiderverkaufSection.dart';
import 'package:website_frontend/sections/member/member_section.dart';
import 'package:website_frontend/sections/news/news_section.dart';
import 'package:website_frontend/sections/oktoberfest/oktoberfest_section.dart';
import 'package:website_frontend/sections/sound/sound_section.dart';
import 'package:website_frontend/sections/top/top_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollSingleton myScrollSingleton = ScrollSingleton();
  final itemListener = ItemPositionsListener.create();

  List indices = [];
  bool showRightNavbar = false;

  List<AppSection> appSections = [
    AppSection(name: "News", icon: Icons.newspaper, isVisible: true),
    AppSection(
        name: "Kleiderverkauf",
        icon: Icons.monetization_on_outlined,
        isVisible: false),
    AppSection(name: "Fotos", icon: Icons.image, isVisible: true),
    AppSection(name: "Agenda", icon: Icons.event_available, isVisible: true),
    AppSection(
        name: "Mitglieder", icon: Icons.people_alt_rounded, isVisible: true),
    AppSection(name: "Sound", icon: Icons.music_note, isVisible: true),
    AppSection(
        name: "Expedition", icon: Icons.local_fire_department, isVisible: true),
    AppSection(
        name: "Oktoberfest", icon: Icons.local_gas_station, isVisible: true),
  ];

  @override
  void initState() {
    super.initState();

    itemListener.itemPositions.addListener(() {
      indices =
          itemListener.itemPositions.value.map((item) => item.index).toList();
      checkVisibility();
    });
  }

  void checkVisibility() {
    if (!indices.contains(0) && (showRightNavbar == false)) {
      setState(() {
        showRightNavbar = true;
      });
    } else if (indices.contains(0) && (showRightNavbar == true)) {
      setState(() {
        showRightNavbar = false;
      });
    }
  }

  Widget buildTimelineTile(IconData iconData, String label, String scrollToItem,
      {bool isFirst = false, bool isLast = false}) {
    return TimelineTile(
      indicatorStyle: IndicatorStyle(
        color: Theme.of(context).primaryColor,
        height: 30,
        width: 30,
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: iconData,
        ),
      ),
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: const LineStyle(thickness: 2),
      alignment: TimelineAlign.end,
      startChild: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => myScrollSingleton.scrollToItem(scrollToItem),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: width < 1250
          ? AppBar(
              leading: GestureDetector(
                child: Image.asset(
                  'assets/goslergrend.png',
                  fit: BoxFit.fitHeight,
                ),
                onTap: () => {
                  GoRouter.of(context).push('/auth'),
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(top: 5, bottom: 5),
                title: Image.asset(
                  'assets/inferno_title.png',
                  height: 50,
                ),
                centerTitle: true,
                background: Image.asset(
                  'assets/background_ohne.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              actions: [
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu),
                  onSelected: (String selectedItem) {
                    myScrollSingleton.scrollToItem(selectedItem);
                  },
                  itemBuilder: (BuildContext context) {
                    return appSections
                        .where(
                            (item) => item.isVisible) // Only show visible items
                        .map((item) {
                      return PopupMenuItem<String>(
                        value: item.name,
                        child: Text(item.name),
                      );
                    }).toList();
                  },
                ),
              ],
              backgroundColor: Theme.of(context).primaryColor,
            )
          : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar(),
            ),
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemScrollController: ScrollSingleton.navBarScrollController,
            itemBuilder: (context, index) {
              if (index == 0) {
                if (width < 1250) {
                  return const SizedBox();
                } else {
                  return Column(
                    children: [
                      TopSection(appSections: appSections),
                    ],
                  );
                }
              } else if (index == 1) {
                return NewsSection();
              } else if (index == 2) {
                return KleiderverkaufSection();
              } else if (index == 3) {
                return GallerySection();
              } else if (index == 4) {
                return AgendaSection();
              } else if (index == 5) {
                return MemberSection();
              } else if (index == 6) {
                return SoundSection();
              } else if (index == 7) {
                return ExpeditionSection();
              } else if (index == 8) {
                return OktoberfestSection();
              } else if (index == 9 && width < 1250) {
                return const GoennerWerden();
              } else if (index == 9 && width > 1250) {
                return const BoxesLargeScale();
              } else if (index == 10 && width < 1250) {
                return const MitgliedWerden();
              } else if (index == 11 && width < 1250) {
                return const ContdownMobile();
              } else if (index == 12) {
                return const BottomBar();
              } else {
                return Container();
              }
            },
            itemCount: 13,
            itemPositionsListener: itemListener,
          ),
          if (showRightNavbar && width > 1500)
            Container(
              margin: const EdgeInsets.only(right: 40),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...appSections
                      .where((section) =>
                          section.isVisible) // Filter only visible sections
                      .map((section) {
                    // Determine if it's the first or last visible section
                    bool isFirst = appSections.indexOf(section) == 0;
                    bool isLast =
                        appSections.indexOf(section) == appSections.length - 1;

                    // Build the TimelineTile for the section
                    return buildTimelineTile(
                      section.icon, // Optional helper to map names to icons
                      section.name,
                      section
                          .name, // Assuming 'scrollToItem' uses the section name
                      isFirst: isFirst,
                      isLast: isLast,
                    );
                  }).toList(),
                ],
              ),
            )
          else
            Container(),
        ],
      ),
    );
  }
}

class ContdownMobile extends StatelessWidget {
  const ContdownMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(230, 230, 230, 1),
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 40,
      ),
      child: Countdown(),
    );
  }
}

class BoxesLargeScale extends StatelessWidget {
  const BoxesLargeScale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            height: 300,
            child: MitgliedWerden(),
          ),
          SizedBox(
            width: 40,
          ),
          SizedBox(
            width: 400,
            height: 300,
            child: GoennerWerden(),
          ),
          SizedBox(
            width: 40,
          ),
          SizedBox(
            width: 400,
            height: 300,
            child: KleiderKaufenBox(),
          ),
        ],
      ),
    );
  }
}
