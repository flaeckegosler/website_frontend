import 'package:flutter/material.dart';
import 'package:website_frontend/models/news_model.dart';
import 'package:website_frontend/sections/news/mobile/news_card.dart';
import 'package:website_frontend/sections/news/mobile/news_card_extended.dart';

class NewsWidget extends StatelessWidget {
  final List<News>? news;
  final int startIndex;
  const NewsWidget({required this.news, required this.startIndex});

  @override
  Widget build(BuildContext context) {
    return _buildNewsList(news!);
  }

  Widget _buildNewsList(List<News> news) {
    Widget newsCards = const Center(
      child: Text('Keine News gefunden!'),
    );
    if (news.isNotEmpty) {
      newsCards = ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (news[index].newsTags == '') {
            return NewsCard(news[index + startIndex]);
          } else {
            return NewsCardExtended(news[index + startIndex]);
          }
        },
        itemCount: 3, //news.length
      );
    } else {
      newsCards = Container();
    }
    return newsCards;
  }
}
