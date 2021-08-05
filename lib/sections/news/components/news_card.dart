import 'package:flutter/material.dart';
import 'package:website_frontend/models/News.dart';

import '../../../constants.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    required this.index,
  });

  final int index;

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  Duration duration = Duration(milliseconds: 200);
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
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
          color: news[widget.index].color,
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
                  image: DecorationImage(
                    image: AssetImage(news[widget.index].userPic),
                  ),
                ),
              ),
            ),
            Text(
              news[widget.index].review,
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
              "Damian Zurmühle",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
