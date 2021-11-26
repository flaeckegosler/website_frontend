import 'package:flutter/material.dart';
import 'package:website_frontend/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final News singleNews;

  const NewsCard(this.singleNews);

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        ' ${singleNews.newsTitle} ',
        textAlign: TextAlign.start,
        style: const TextStyle(
          height: 1.8,
          fontSize: 20.0,
          color: Colors.white,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
            ),
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthor() {
    if (singleNews.newsCreatedBy == 'Administrator') {
      return const SizedBox(
        height: 10,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          'von ${singleNews.newsCreatedBy}',
          textAlign: TextAlign.start,
          style: const TextStyle(
            height: 1.2,
            fontSize: 12.0,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
              ),
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 8.0,
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed<bool>(
          context, '/specific_news/' + singleNews.id,
          arguments: singleNews),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        height: 250,
        //MediaQuery.of(context).size.heiSght,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: const Border(
            left: BorderSide(color: Colors.white, width: 10.0),
            top: BorderSide(color: Colors.white, width: 10.0),
            right: BorderSide(color: Colors.white, width: 10.0),
            bottom: BorderSide(color: Colors.white, width: 0.0),
          ),
          //borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage(singleNews.imageURL), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _buildTitle(),
            _buildAuthor(),
          ],
        ),
      ),
    );
  }
}
