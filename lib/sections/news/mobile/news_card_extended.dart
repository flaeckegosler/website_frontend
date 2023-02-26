//import 'package:Flaeckegosler/widgets/news/buildRedakteur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website_frontend/models/news_model.dart';
import 'package:website_frontend/sections/news/mobile/build_redakteur.dart';

class NewsCardExtended extends StatelessWidget {
  final News singleNews;

  const NewsCardExtended(this.singleNews);

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              singleNews.newsTitle,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsTags(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            singleNews.newsTags,
            textAlign: TextAlign.start,
            style: const TextStyle(
              height: 1.2,
              fontSize: 12.0,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
          ),
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
        padding: const EdgeInsets.only(left: 12.0, bottom: 8, top: 5),
        child: Text(
          'von ${singleNews.newsCreatedBy}',
          textAlign: TextAlign.start,
          style: const TextStyle(
            height: 1.2,
            fontSize: 12.0,
            fontWeight: FontWeight.w100,
            fontFamily: 'Oswald',
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
      onTap: () => GoRouter.of(context).push('/news', extra: singleNews),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 7.5, top: 7.5, left: 10, right: 10),
        child: Container(
          height: 220,
          //MediaQuery.of(context).size.heiSght,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            image: DecorationImage(
              image: CachedNetworkImageProvider(singleNews.imageURL),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (singleNews.newsTags == "")
                const SizedBox()
              else
                buildRedakteurHomeNews(singleNews.newsCreatedBy, context),
              if (singleNews.newsTags == "")
                const SizedBox()
              else
                _buildNewsTags(context),
              _buildTitle(),
              _buildAuthor(),
            ],
          ),
        ),
      ),
    );
  }
}
