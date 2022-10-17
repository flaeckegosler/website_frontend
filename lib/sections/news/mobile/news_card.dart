import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:website_frontend/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final News singleNews;

  const NewsCard(this.singleNews);

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
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
        padding: const EdgeInsets.only(left: 15.0, bottom: 15, top: 5),
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
      onTap: () =>
          context.vxNav.push(Uri(path: '/specific_news'), params: singleNews),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 7.5, top: 7.5, left: 10, right: 10),
        child: Container(
          height: 250,
          //MediaQuery.of(context).size.heiSght,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
      ),
    );
  }
}
