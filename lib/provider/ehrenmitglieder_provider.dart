import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:website_frontend/models/ehrenmitglied.dart';

class EhrenMitgliederProvider with ChangeNotifier {
  final List<EhrenMitglied> _ehrenMitglieder = [];

  List<EhrenMitglied> get allEhrenMitglieder {
    _ehrenMitglieder.sort((a, b) => a.name.compareTo(b.name));
    return List.from(_ehrenMitglieder);
  }

  List<EhrenMitglied> get allAktivEhrenMitglieder {
    List<EhrenMitglied> _aktivEhrenmitglieder = [];
    _aktivEhrenmitglieder = _ehrenMitglieder
        .where((element) => element.isAktivEhrenMitglied == true)
        .toList();
    _aktivEhrenmitglieder.sort((a, b) => a.name.compareTo(b.name));
    return List.from(_aktivEhrenmitglieder);
  }

  List<EhrenMitglied> get allNichtAktivEhrenMitglieder {
    List<EhrenMitglied> _aktivEhrenmitglieder = [];
    _aktivEhrenmitglieder = _ehrenMitglieder
        .where((element) => element.isAktivEhrenMitglied == false)
        .toList();
    _aktivEhrenmitglieder.sort((a, b) => a.name.compareTo(b.name));
    return List.from(_aktivEhrenmitglieder);
  }

  List<EhrenMitglied> ehrenMitgliedFromJson(String str) =>
      List<EhrenMitglied>.from(
          json.decode(str).map((x) => EhrenMitglied.fromJson(x)));

  Future<void> readEhrenMitgliederJson() async {
    final String response =
        await rootBundle.loadString('assets/jsons/ehrenmitglieder.json');
    if (_ehrenMitglieder.isEmpty) {
      _ehrenMitglieder.addAll(ehrenMitgliedFromJson(response));
    }
  }
}
