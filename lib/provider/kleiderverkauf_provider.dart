import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/models/basic_page_model.dart';

class KleiderverkaufProvider with ChangeNotifier {
  late BasicPageModel _kleiderverkauf;

  BasicPageModel get getKleiderverkauf {
    return _kleiderverkauf;
  }

  Future<void> fetchKleiderverkauf() async {
    final url =
        Uri.parse('https://api.flaeckegosler.ch/app/kleiderverkauf-to-json/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData =
          json.decode(response.body) as Map<String, dynamic>;

      _kleiderverkauf = BasicPageModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
