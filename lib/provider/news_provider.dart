import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:website_frontend/models/news_model.dart';

class NewsProvider with ChangeNotifier {
  List<News> _news = [];

  List<News> get allNews {
    return List.from(_news);
  }

  List<News> getLatest(int number) {
    final List<News> result = [];
    for (int i = 0; i < number; i++) {
      result.add(_news[i]);
    }
    return result;
  }

  Future<void> fetchNewsList() async {
    final url = Uri.parse('https://flaeckegosler.ch/app/news-to-json/');
    final response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final List<News> fetchedProductList = [];
      final Map<String, dynamic> newsListData =
          json.decode(response.body) as Map<String, dynamic>;
      newsListData.forEach((String newsId, dynamic newsData) {
        final News news = News(
          id: newsId.toString(),
          newsTitle: newsData['newsTitle'] as String,
          imageURL: newsData['imageURL'] as String,
          cropImageURL: newsData['cropImageURL'] as String,
          timeCreatedUnix: newsData['timeCreatedUnix'] as int,
          timeCreatedFormatted: newsData['timeCreatedFormatted'] as String,
          newsCreatedBy: newsData['newsCreatedBy'] != null
              ? (newsData['newsCreatedBy'] as String)
              : "Administrator",
          newsIntroText: newsData['newsIntroText'] as String,
          newsMainText: newsData['newsMainText'] as String,
          imageDescription: newsData['imageDescription'] as String?,
          newsTags: newsData['newsTags'] as String,
          galleryLink: newsData['galleryLink'] as String,
        );
        fetchedProductList.add(news);
      });
      _news = fetchedProductList;
    } else {
      throw Exception("Unable to get news");
    }
  }
}
