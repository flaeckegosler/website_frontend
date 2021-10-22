import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/provider/news_provider.dart';
import 'package:website_frontend/sections/news/components/news_card.dart';
import 'package:provider/provider.dart';

class NewsSection extends StatefulWidget {
  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  bool _isLoading = false;

  double getNews0Width = 350;
  double getNews1Width = 350;
  double getNews2Width = 350;

  bool showAllActive = false;

  int newsFlexTest = 0;

  void getNewsWidthMethod(int index, {required bool showAllActive}) {
    if (index == 0 && showAllActive == false) {
      getNews0Width = 1250;
      getNews1Width = 0;
      getNews2Width = 0;
    } else if (index == 1 && showAllActive == false) {
      getNews0Width = 0;
      getNews1Width = 1250;
      getNews2Width = 0;
    } else if (index == 2 && showAllActive == false) {
      getNews0Width = 0;
      getNews1Width = 0;
      getNews2Width = 1250;
    } else if (showAllActive == true) {
      getNews0Width = 350;
      getNews1Width = 350;
      getNews2Width = 350;
    }
  }

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
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = IntTween(begin: 0, end: 2400).animate(_animationController);
    _animation.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
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
                  newsWidget(0),
                if (_isLoading == true)
                  const CircularProgressIndicator()
                else
                  newsWidget(1),
                if (_isLoading == true)
                  const CircularProgressIndicator()
                else
                  newsWidget(2),
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

  Widget addIcon(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 50.0,
      child: SizedBox.fromSize(
        size: const Size(50, 50), // button width and height
        child: ClipOval(
          child: Material(
            color: showAllActive == false
                ? Colors.green
                : Colors.red, // button color
            child: InkWell(
              splashColor: const Color.fromRGBO(248, 177, 1, 1),
              // splash color
              onTap: () {
                setState(() {
                  getNewsWidthMethod(index, showAllActive: showAllActive);
                  if (_animationController.value as int == 0) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  showAllActive == false
                      ? showAllActive = true
                      : showAllActive = false;
                });
              },
              // button pressed
              child: showAllActive == false
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

  double getNewsWidth(int index) {
    if (index == 0) return getNews0Width;
    if (index == 1) return getNews1Width;
    if (index == 2) return getNews2Width;
    throw Exception();
  }

  Widget newsWidget(int index) {
    final _newsProvider = context.watch<NewsProvider>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      height: 575, //25+  NewsCard$
      width: getNewsWidth(index),
      child: Row(
        children: [
          Expanded(
            flex: 1200,
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 25),
                    NewsCard(index: index),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: addIcon(index),
                  ),
                ),
              ],
            ),
          ),
          if (showAllActive == true) const SizedBox(width: 25),
          Expanded(
            flex: _animation.value as int,
            child: SizedBox(
              width: 0,
              //  color: Colors.grey[200],
              child: ListView(
                children: [
                  const SizedBox(
                    height: 25,
                    width: 0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(20),
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
}
