import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/provider/news_provider.dart';
import 'package:website_frontend/sections/news/components/news_card.dart';

class NewsSection extends StatefulWidget {
  @override
  _NewsSectionState createState() => _NewsSectionState();
}

enum ActiveNews { none, first, second, third }

class _NewsSectionState extends State<NewsSection>
    with TickerProviderStateMixin {
  // late AnimationController _animationController;
  // late Animation _animation;

  late AnimationController _fadeController;
  late Animation _fadeInAnimation;

  bool _isLoading = false;

  int n0preview = 350;
  int n1preview = 350;
  int n2preview = 350;

  int n0text = 0;
  int n1text = 0;
  int n2text = 0;

  ActiveNews activeNews = ActiveNews.none;

  //Fetch all Listings
  Future fetchNewsList() async {
    setState(() {
      _isLoading = true;
    });
    //await Provider.of<NewsProvider>(context, listen: false).createNews();
    await Provider.of<NewsProvider>(context, listen: false).fetchNewsList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNewsList();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(_fadeController);
    // _animationController =
    // AnimationController(duration: const Duration(seconds: 1), vsync: this);
    //_animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    // _animation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    //  _animationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  // ignore: avoid_void_async
  void _asyncPauseAndContinueAnimationForward() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _fadeController.forward();
    });
  }

  // ignore: avoid_void_async
  void _asyncPauseAndContinueAnimationReverse() async {
    await _fadeController.reverse();
    setState(() {
      activeNews = ActiveNews.none;
      n0preview = 350;
      n1preview = 350;
      n2preview = 350;
      n0text = 0;
      n1text = 0;
      n2text = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget addIcon(int index, ActiveNews _activeNews) {
      return Container(
        margin: const EdgeInsets.only(right: 5),
        height: 50.0,
        child: SizedBox.fromSize(
          size: const Size(50, 50), // button width and height
          child: ClipOval(
            child: Material(
              color: ActiveNews.none == _activeNews
                  ? Colors.green
                  : Colors.red, // button color
              child: InkWell(
                splashColor: const Color.fromRGBO(248, 177, 1, 1),
                // splash color
                onTap: () {
                  setState(() {
                    if (index == 0 && _activeNews == ActiveNews.none) {
                      activeNews = ActiveNews.first;
                      n1preview = 0;
                      n2preview = 0;
                      _asyncPauseAndContinueAnimationForward();
                    } else if (index == 1 && _activeNews == ActiveNews.none) {
                      activeNews = ActiveNews.second;
                      n0preview = 0;
                      n1text = 875;
                      n2preview = 0;
                      _asyncPauseAndContinueAnimationForward();
                    } else if (index == 2 && _activeNews == ActiveNews.none) {
                      activeNews = ActiveNews.third;
                      n0preview = 0;
                      n1preview = 0;
                      n2text = 875;
                      _asyncPauseAndContinueAnimationForward();
                    } else if (_activeNews == ActiveNews.first ||
                        _activeNews == ActiveNews.second ||
                        _activeNews == ActiveNews.third) {
                      _asyncPauseAndContinueAnimationReverse();
                    }
                  });
                },
                // button pressed
                child: (activeNews == ActiveNews.none)
                    ? const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      )
                    : const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 25,
                      ), // icon
              ),
            ),
          ),
        ),
      );
    }

    double getWidthPreview(int index) {
      if (index == 0) {
        return n0preview as double;
      } else if (index == 1) {
        return n1preview as double;
      } else if (index == 2) {
        return n2preview as double;
      } else {
        throw Exception();
      }
    }

    double getWidthNewsText(int index, ActiveNews activeNews) {
      if (activeNews == ActiveNews.none) return 0;
      if (index == 0 && activeNews == ActiveNews.first) return 875;
      if (index == 1 && activeNews == ActiveNews.second) return 875;
      if (index == 2 && activeNews == ActiveNews.third) return 875;
      //else
      return 0;
    }

    Widget newsWidget(int index, ActiveNews activeNews) {
      final _newsProvider = context.watch<NewsProvider>();
      return Container(
        //  color: Colors.red,
        height: 575, //25+  NewsCard$
        child: Row(
          children: [
            AnimatedContainer(
              width: getWidthPreview(index),
              duration: const Duration(seconds: 1),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 25,
                        // color: Colors.purple,
                      ),
                      NewsCard(index: index),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: addIcon(index, activeNews),
                    ),
                  ),
                ],
              ),
            ),
            if (activeNews == ActiveNews.first && index == 0)
              Container(
                width: 25,
                //  color: Colors.blue,
              ),
            if (activeNews == ActiveNews.second && index == 1)
              Container(
                width: 25,
                // color: Colors.blue,
              ),
            if (activeNews == ActiveNews.third && index == 2)
              Container(
                width: 25,
                // color: Colors.blue,
              ),
            FadeTransition(
              opacity: _fadeInAnimation as Animation<double>,
              child: AnimatedContainer(
                width: getWidthNewsText(index, activeNews),
                duration: const Duration(seconds: 1),
                child: ListView(
                  children: [
                    Container(
                      height: 25,
                      width: 0,
                      //  color: Colors.yellow,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        // padding: const EdgeInsets.all(20),
                        color: Colors.grey[200],
                        child: Html(
                          data: _newsProvider.allNews[index].newsMainText,
                          style: {
                            "h1": Style(
                              fontFamily: 'serif',
                              backgroundColor: Colors.black,
                              color: Colors.white,
                            ),
                            "p": Style(
                              fontFamily: 'serif',
                              padding: const EdgeInsets.all(1),
                              fontSize: FontSize.em(1),
                            ),
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Align(
      child: Container(
        alignment: Alignment.center,
        // color: Colors.blue, //good for debugging
        constraints: const BoxConstraints(maxWidth: 1250),
        child: Column(
          children: [
            const SectionTitle(
              title: "News",
              subTitle: "Aktuelles auf einen Blick!",
              color: Color(0xFF00B1FF),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_isLoading == true)
                  const CircularProgressIndicator()
                else
                  newsWidget(0, activeNews),
                if (_isLoading == true)
                  const CircularProgressIndicator()
                else
                  newsWidget(1, activeNews),
                if (_isLoading == true)
                  const CircularProgressIndicator()
                else
                  newsWidget(2, activeNews),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
