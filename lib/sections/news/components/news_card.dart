import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/models/authors.dart';
import 'package:website_frontend/provider/news_provider.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsCard extends StatefulWidget {
  final key;
  final int index;

  const NewsCard({required this.index, required this.key});

  @override
  NewsCardState createState() => NewsCardState();
}

class NewsCardState extends State<NewsCard> with TickerProviderStateMixin {
  bool _isLoading = false;

  late AnimationController fadeController;
  late Animation _fadeInAnimation;

  @override
  initState() {
    fetchNewsList();
    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeInAnimation = Tween(begin: 1.0, end: 0.0).animate(fadeController);
    super.initState();
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

  Duration duration = const Duration(milliseconds: 200);
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final _newsProvider = context.watch<NewsProvider>();
    if (_isLoading) {
      return const CircularProgressIndicator();
    } else {
      return Stack(
        children: [
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            onHover: (value) {
              setState(() {
                isHover = value;
              });
            },
            child: Container(
              height: 550, //Otherwise card gets smaller
              //    width: 350,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [if (isHover) kDefaultCardShadow],
              ),
              child: FadeTransition(
                opacity: _fadeInAnimation as Animation<double>,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                _newsProvider.allNews[widget.index].imageURL),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.access_time, size: 14),
                        Text(
                            " ${_newsProvider.allNews[widget.index].timeCreatedFormatted}",
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      //This column is used to reduce space between title and intro text
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Text(
                              _newsProvider.allNews[widget.index].newsTitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 16),
                            ),
                          ),
                        ),
                        Html(
                          data:
                              _newsProvider.allNews[widget.index].newsIntroText,
                          style: {
                            "p": Style(
                              fontFamily: 'serif',
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              fontSize: FontSize.em(1),
                            ),
                          },
                        ),
                      ],
                    ),
                    buildRedakteur(
                        _newsProvider.allNews[widget.index].newsCreatedBy),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget buildRedakteur(String newsCreatedBy) {
    if (Authors.getRedakteur(newsCreatedBy) != "") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(
              Authors.getRedakteur(newsCreatedBy),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "   von $newsCreatedBy",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
