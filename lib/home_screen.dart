import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/provider/scroll_singleton.dart';
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
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ScrollablePositionedList.builder(
        itemScrollController: ScrollSingleton.navBarScrollController,
        itemBuilder: (context, index) {
          if (index == 0) {
            if (width < 1250) {
              return AppBar(
                backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
                actions: const [],
              );
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
            return const BottomBar();
          } else {
            return Container();
          }
        },
        itemCount: 6,
      ),
    );
  }
}
