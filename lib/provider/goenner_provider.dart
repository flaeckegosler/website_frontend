import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/models/basic_page_model.dart';

class GoennerProvider with ChangeNotifier {
  late BasicPageModel _goenner_page;

  BasicPageModel get getGoennerPageData {
    return _goenner_page;
  }

  Future<void> fetchGoennerPageData() async {
    final url = Uri.parse('https://api.flaeckegosler.ch/app/goenner-to-json/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData =
          json.decode(response.body) as Map<String, dynamic>;

      _goenner_page = BasicPageModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
