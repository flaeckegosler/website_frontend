import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:website_frontend/models/vorstand.dart';

class VorstandProvider with ChangeNotifier {
  final List<Vorstand> _vorstand = [];

  List<Vorstand> get allVorstand {
    _vorstand.sort((a, b) => b.jahr.compareTo(a.jahr));
    return List.from(_vorstand);
  }

  List<Vorstand> VorstandFromJson(String str) =>
      List<Vorstand>.from(json.decode(str).map((x) => Vorstand.fromJson(x as Map<String, dynamic>)) as Iterable<dynamic>);

  Future<void> readVorstandJson() async {
    final String response =
        await rootBundle.loadString('assets/jsons/vorstand.json');
    if (_vorstand.isEmpty) {
      _vorstand.addAll(VorstandFromJson(response));
    }
  }
}
