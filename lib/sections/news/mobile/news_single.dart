import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_frontend/models/authors.dart';
import 'package:website_frontend/models/news_model.dart';
import 'package:website_frontend/provider/color_singleton.dart';
import 'package:website_frontend/sections/news/mobile/title_default.dart';

Future launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: false);
  } else {
    print('Could not launch $url');
  }
}

class SingleNews extends StatelessWidget {
  final News singleNews;

  const SingleNews(this.singleNews);

  Widget _buildTitelBild() {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(singleNews.imageURL),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageDescription() {
    if (singleNews.imageDescription != null) {
      return Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Text(
          singleNews.imageDescription!,
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
      );
    } else {
      return const SizedBox(
        height: 10,
      );
    }
  }

  Widget _buildMainText() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Html(
        data: singleNews.newsMainText,
        /* onLinkTap: (url) {
          if (url.startsWith('http') || url.startsWith('www')) {
            print(url.startsWith('http'));
            launchURL(url);
            print("Opening $url...");
          } else {
            launchURL('https://flaeckegosler.ch/' + url);
            print("Opening $url...");
          }
        },*/
      ),
    );
  }

  Widget buildRedakteur(String newsCreatedBy) {
    if (Authors.getRedakteur(newsCreatedBy) != "") {
      return Column(
        children: <Widget>[
          const Padding(
              padding:
                  EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 10),
              child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: ColorSingleton().mainTheme,
                radius: 35,
                backgroundImage: AssetImage(
                  Authors.getRedakteur(newsCreatedBy),
                ),
              ),
              Text("   von $newsCreatedBy"),
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: Divider()),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
        ),
        body: ListView(
          children: <Widget>[
            _buildTitelBild(),
            _buildImageDescription(),
            Container(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: TitleDefault(singleNews.newsTitle),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.access_time, size: 12),
                  Text(
                    " ${singleNews.timeCreatedFormatted}",
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: Html(
                data: "<b>${singleNews.newsIntroText}</b>",
              ),
            ),
            buildRedakteur(singleNews.newsCreatedBy),
            _buildMainText(),
          ],
        ),
      ),
    );
  }
}
