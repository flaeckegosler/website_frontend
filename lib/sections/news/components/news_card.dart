import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/provider/news_provider.dart';

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

  Duration duration = Duration(milliseconds: 200);
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final _newsProvider = context.watch<NewsProvider>();
    if (_isLoading) {
      return CircularProgressIndicator();
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
          margin: EdgeInsets.only(top: kDefaultPadding * 3),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 350,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) kDefaultCardShadow],
          ),
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(0, -55),
                child: AnimatedContainer(
                  duration: duration,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 10),
                    boxShadow: [if (!isHover) kDefaultCardShadow],
                    //  image: DecorationImage(
                    // image: AssetImage(news[widget.index].userPic),
                    //    ),
                  ),
                ),
              ),
              Text(
                _newsProvider.allNews[widget.index].newsMainText,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),
              SizedBox(height: kDefaultPadding * 2),
              Text(
                _newsProvider.allNews[widget.index].newsCreatedBy,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
    }
  }
}
