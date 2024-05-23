import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/mobile/countdown.dart';
import 'package:website_frontend/mobile/goenner_werden.dart';
import 'package:website_frontend/mobile/kleider_kaufen_box.dart';
import 'package:website_frontend/mobile/mitglied_werden.dart';
import 'package:website_frontend/provider/scroll_singleton.dart';
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

  @override
  void initState() {
    super.initState();

    itemListener.itemPositions.addListener(() {
      indices = itemListener.itemPositions.value
          // .where((element) {
          //    print("INDEXTEST:" + element.index.toString());
          //  final isTopVisible = element.itemLeadingEdge >= 0;
          //  final isBottomVisible = element.itemTrailingEdge <= 1;
          //  return isBottomVisible;
          // })
          .map((item) => item.index)
          .toList();
      checkVisibility();
      //   setNavBarSizes();
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
                  onSelected: (String result) {
                    switch (result) {
                      case 'option1':
                        myScrollSingleton.scrollToItem("News");
                        break;
                      case 'option2':
                        myScrollSingleton.scrollToItem("Kleiderverkauf");
                        break;
                      case 'option3':
                        myScrollSingleton.scrollToItem("Fotos");
                        break;
                      case 'option4':
                        myScrollSingleton.scrollToItem("Agenda");
                        break;
                      case 'option5':
                        myScrollSingleton.scrollToItem("Mitglieder");
                        break;
                      case 'option6':
                        myScrollSingleton.scrollToItem("Sound");
                        break;
                      case 'option7':
                        myScrollSingleton.scrollToItem("Expedition");
                        break;
                      case 'option8':
                        myScrollSingleton.scrollToItem("Oktoberfest");
                        break;
                      default:
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'option1',
                      child: Text('News'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option2',
                      child: Text('Kleiderverkauf'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option3',
                      child: Text('Fotos'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option4',
                      child: Text('Agenda'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option5',
                      child: Text('Mitglieder'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option6',
                      child: Text('Sound'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option7',
                      child: Text('Expedition'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option8',
                      child: Text('Oktoberfest'),
                    ),
                  ],
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
                      TopSection(),
                    ],
                  );
                }
              } else if (index == 1 && vorfasnachtModus == true) {
                return Column(
                  children: [
                    //OktoberfestSection(),
                    //ExpeditionSection(),
                    NewsSection(),
                  ],
                );
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
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.newspaper,
                      ),
                    ),
                    isFirst: true,
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
                            onTap: () => myScrollSingleton.scrollToItem("News"),
                            child: /* TweenAnimationBuilder<double>(
                                  duration: const Duration(milliseconds: 500),
                                  tween: Tween<double>(
                                    begin: _navBarNewsTextSize,
                                    end: _navBarNewsTextSize,
                                  ),
                                  builder: (_, size, __) =>*/
                                const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "News",
                                style: TextStyle(
                                  fontSize: 16, //size,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            //      ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.monetization_on_outlined,
                      ),
                    ),
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
                            onTap: () => myScrollSingleton
                                .scrollToItem("Kleiderverkauf"),
                            child: /* TweenAnimationBuilder<double>(
                                  duration: const Duration(milliseconds: 500),
                                  tween: Tween<double>(
                                    begin: _navBarNewsTextSize,
                                    end: _navBarNewsTextSize,
                                  ),
                                  builder: (_, size, __) =>*/
                                const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Kleiderverkauf",
                                style: TextStyle(
                                  fontSize: 16, //size,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            //      ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.image,
                      ),
                    ),
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
                            onTap: () =>
                                myScrollSingleton.scrollToItem("Fotos"),
                            child: /* TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 500),
                              tween: Tween<double>(
                                begin: _navBarFotosTextSize,
                                end: _navBarFotosTextSize,
                              ),
                              builder: (_, size, __) => */
                                const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Fotos",
                                style: TextStyle(
                                  fontSize: 16, //size,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //      ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.event_available,
                      ),
                    ),
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
                            onTap: () =>
                                myScrollSingleton.scrollToItem("Agenda"),
                            child: /* TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 500),
                              tween: Tween<double>(
                                begin: _navBarAgendaTextSize,
                                end: _navBarAgendaTextSize,
                              ),
                              builder: (_, size, __) => */
                                const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Agenda",
                                style: TextStyle(
                                  fontSize: 16, //size,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //     ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.people_alt_rounded,
                      ),
                    ),
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
                            onTap: () =>
                                myScrollSingleton.scrollToItem("Mitglieder"),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Mitglieder",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.music_note,
                      ),
                    ),
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
                            onTap: () =>
                                myScrollSingleton.scrollToItem("Sound"),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Sound",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.local_fire_department,
                      ),
                    ),
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
                            onTap: () =>
                                myScrollSingleton.scrollToItem("Expedition"),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Expedition",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: Theme.of(context).primaryColor,
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.local_gas_station,
                      ),
                    ),
                    beforeLineStyle: const LineStyle(thickness: 2),
                    alignment: TimelineAlign.end,
                    isLast: true,
                    startChild: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () =>
                                myScrollSingleton.scrollToItem("Oktoberfest"),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Oktoberfest",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
