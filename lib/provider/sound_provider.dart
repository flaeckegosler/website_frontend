import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/models/sound_item.dart';

class SoundProvider with ChangeNotifier {
  List<SoundItem> _items = [];

  List<SoundItem> get allSoundItems {
    return List.from(_items);
  }

  bool isDivisibleByThree() {
    return _items.length % 3 == 0;
  }

  Future<void> fetchSoundItems() async {
    final url = Uri.parse('https://api.flaeckegosler.ch/app/sound-to-json/');
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
          json.decode(response.body) as List<dynamic>;
      final Map<String, dynamic> soundData =
          jsonData[0] as Map<String, dynamic>;
      final List<dynamic> jsonItems = soundData['items'] as List<dynamic>;

      final List<SoundItem> soundItems = jsonItems.map((item) {
        if (item != null && item is Map<String, dynamic>) {
          return SoundItem.fromJson(item);
        } else {
          throw Exception('Invalid agenda item');
        }
      }).toList();

      _items = soundItems;
    } else {
      throw Exception('Failed to fetch agenda items');
    }
  }
}
