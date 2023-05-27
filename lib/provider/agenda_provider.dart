import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/models/agenda.dart';

class AgendaProvider with ChangeNotifier {
  List<AgendaItem> _items = [];

  List<AgendaItem> get allPictures {
    return List.from(_items);
  }

  Future<void> fetchAgendaItems() async {
    final url = Uri.parse('https://api.flaeckegosler.ch/app/agenda-to-json/');
    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
          json.decode(response.body) as List<dynamic>;
      final Map<String, dynamic> agendaData =
          jsonData[0] as Map<String, dynamic>;
      final List<dynamic> jsonItems = agendaData['items'] as List<dynamic>;

      List<AgendaItem> agendaItems = jsonItems.map((item) {
        if (item != null && item is Map<String, dynamic>) {
          return AgendaItem.fromJson(item);
        } else {
          throw Exception('Invalid agenda item');
        }
      }).toList();
      _items = agendaItems;
    } else {
      throw Exception('Failed to fetch agenda items');
    }
  }
}
