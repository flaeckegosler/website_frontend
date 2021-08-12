import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/provider/news_provider.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    required this.index,
  });

  final int index;

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool _isLoading = false;

  @override
  initState() {
    fetchNewsList();
    super.initState();
  }

  //Fetch all Listings
  Future fetchNewsList() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<NewsProvider>(context, listen: false).createNews();
    //await Provider.of<NewsProvider>(context, listen: false).fetchNewsList();
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
      return InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: duration,
          margin: const EdgeInsets.only(top: kDefaultPadding * 3),
          // padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 450,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) kDefaultCardShadow],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(
                          _newsProvider.allNews[widget.index].imageURL),
                      fit: BoxFit.cover),
                ),
              ),
              Html(
                data: _newsProvider.allNews[widget.index].newsIntroText,
                /*style: const TextStyle(
                  color: kTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ), */
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    _newsProvider.allNews[widget.index].newsCreatedBy,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Transform.translate(
                    offset: const Offset(0, 0),
                    child: AnimatedContainer(
                      duration: duration,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [if (!isHover) kDefaultCardShadow],
                        image: const DecorationImage(
                          image: AssetImage("/redakteure/raphikoch.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }
  }
}
