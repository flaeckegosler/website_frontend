import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website_frontend/provider/scroll_singleton.dart';
import 'package:website_frontend/sections/agenda/agenda_section.dart';
import 'package:website_frontend/sections/expedition/expedition.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';
import 'package:website_frontend/sections/gallery/gallery_section.dart';
import 'package:website_frontend/sections/member/member_section.dart';
import 'package:website_frontend/sections/mobile/goenner_werden.dart';
import 'package:website_frontend/sections/mobile/mitglied_werden.dart';
import 'package:website_frontend/sections/news/news_section.dart';
import 'package:website_frontend/sections/sound/sound_section.dart';
import 'package:website_frontend/sections/top/top_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollSingleton myScrollSingleton = ScrollSingleton();
  final itemListener = ItemPositionsListener.create();

//  double _navBarNewsTextSize = 16;
//  double _navBarFotosTextSize = 16;
//  double _navBarAgendaTextSize = 16;

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
      print(indices);
    });
  }

/*
  void setNavBarSizes() {
    if (indices.first == 1 && (_navBarNewsTextSize.toInt() == 16)) {
      setState(() {
        _navBarNewsTextSize = 40;
        _navBarFotosTextSize = 16;
        _navBarAgendaTextSize = 16;
      });
      print("eins");
    } else if (indices.first == 2 && (_navBarFotosTextSize.toInt() == 16)) {
      setState(() {
        _navBarNewsTextSize = 16;
        _navBarFotosTextSize = 40;
        _navBarAgendaTextSize = 16;
      });
      print("zwei");
    } else if (indices.first == 3 && (_navBarAgendaTextSize.toInt() == 16)) {
      setState(() {
        _navBarNewsTextSize = 16;
        _navBarFotosTextSize = 16;
        _navBarAgendaTextSize = 40;
      });
      print("drei");
    } else if (indices.first == 4) {
      _navBarNewsTextSize = 12;
      print("vier");
    } else if (indices.first == 5) {
      _navBarNewsTextSize = 12;
      print("fünf");
    } else if (indices.first == 5) {
      _navBarNewsTextSize = 12;
      print("sechs");
    }
  }
*/
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
                onLongPress: () => {},
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(top: 5, bottom: 5),
                title: Image.asset(
                  'assets/goslermythos_title.png',
                  height: 50,
                ),
                centerTitle: true,
                background: Image.asset(
                  'assets/MUSTER_REPETIEREND.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              actions: [
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu),
                  onSelected: (String result) {
                    switch (result) {
                      case 'option1':
                        print('option 1 clicked');
                        myScrollSingleton.scrollToItem("News");
                        break;
                      case 'option2':
                        print('option 2 clicked');
                        myScrollSingleton.scrollToItem("Fotos");
                        break;
                      case 'option3':
                        print('option 3 clicked');
                        myScrollSingleton.scrollToItem("Agenda");
                        break;
                      case 'option4':
                        print('option 4 clicked');
                        myScrollSingleton.scrollToItem("Mitglieder");
                        break;
                      case 'option5':
                        print('option 5 clicked');
                        myScrollSingleton.scrollToItem("Sound");
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
                      child: Text('Fotos'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option3',
                      child: Text('Agenda'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option4',
                      child: Text('Mitglieder'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option5',
                      child: Text('Sound'),
                    ),
                  ],
                )
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
                  return ExpeditionSection();
                } else {
                  return Column(
                    children: [
                      TopSection(),
                      ExpeditionSection(),
                    ],
                  );
                }
              } else if (index == 1) {
                return NewsSection();
              } else if (index == 2) {
                return GallerySection();
              } else if (index == 3) {
                return AgendaSection();
              } else if (index == 4) {
                return MemberSection();
              } else if (index == 5) {
                return SoundSection();
              } else if (index == 6 && width < 1250) {
                return const GoennerWerden();
              } else if (index == 7 && width < 1250) {
                return const MitgliedWerden();
              } else if (index == 8) {
                return const BottomBar();
              } else {
                return Container();
              }
            },
            itemCount: 9,
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
                      color: const Color.fromRGBO(147, 90, 161, 1),
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
                      color: const Color.fromRGBO(147, 90, 161, 1),
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
                              )
                              //      ),
                              ),
                        ],
                      ),
                    ),
                  ),
                  TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      color: const Color.fromRGBO(147, 90, 161, 1),
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
                                    fontWeight: FontWeight.bold),
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
                      color: const Color.fromRGBO(147, 90, 161, 1),
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
                      color: const Color.fromRGBO(147, 90, 161, 1),
                      height: 30,
                      width: 30,
                      iconStyle: IconStyle(
                        color: Colors.white,
                        iconData: Icons.music_note,
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
                                myScrollSingleton.scrollToItem("Sound"),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Sound",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
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
