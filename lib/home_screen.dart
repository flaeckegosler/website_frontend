import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/provider/color_singleton.dart';
import 'package:website_frontend/provider/scroll_singleton.dart';
import 'package:website_frontend/sections/expedition/expedition_section.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';
import 'package:website_frontend/sections/gallery/gallery_section.dart';
import 'package:website_frontend/sections/member/member_section.dart';
import 'package:website_frontend/sections/news/news_section.dart';

import 'package:website_frontend/sections/top/top_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollSingleton myScrollSingleton = ScrollSingleton();
  final itemListener = ItemPositionsListener.create();

  List indices = [];
  List indices2 = [];
  bool showRightNavbar = false;

  @override
  void initState() {
    super.initState();

    itemListener.itemPositions.addListener(() {
      indices = itemListener.itemPositions.value
          .where((element) {
            final isTopVisible = element.itemLeadingEdge >= 0;
            final isBottomVisible = element.itemTrailingEdge <= 1;
            return isBottomVisible;
          })
          .map((item) => item.index)
          .toList();
      indices2 = itemListener.itemPositions.value
          .where((element) {
            final isTopVisible = element.itemLeadingEdge >= 0.2;
            final isBottomVisible = element.itemTrailingEdge <= 0.8;
            return isBottomVisible && isTopVisible;
          })
          .map((item) => item.index)
          .toList();
      checkVisibility();
      print(indices);
      print("i2:" + indices2.toString());
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
                        myScrollSingleton.scrollToItem("Mitglieder");
                        break;
                      case 'option4':
                        print('option 4 clicked');
                        myScrollSingleton.scrollToItem("Expedition");
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
                      child: Text('Mitglieder'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'option4',
                      child: Text('Expedition'),
                    ),
                  ],
                )
              ],
              backgroundColor: ColorSingleton().placeHolderColor,
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
                  return TopSection();
                }
              } else if (index == 1) {
                return const SizedBox(height: kDefaultPadding * 2);
              } else if (index == 2) {
                return NewsSection();
              } else if (index == 3) {
                return GallerySection();
              } else if (index == 4) {
                return MemberSection();
              } else if (index == 5) {
                return ExpeditionSection();
              } else if (index == 6) {
                return const BottomBar();
              } else {
                return Container();
              }
            },
            itemCount: 7,
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
                  GestureDetector(
                    onTap: () => myScrollSingleton.scrollToItem("News"),
                    child: const Text(
                      "News",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black87),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => myScrollSingleton.scrollToItem("Fotos"),
                    child: const Text(
                      "Fotos",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black87),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => myScrollSingleton.scrollToItem("Mitglieder"),
                    child: const Text(
                      "Mitglieder",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black87),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => myScrollSingleton.scrollToItem("Expedition"),
                    child: const Text(
                      "Expedition",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black87),
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
