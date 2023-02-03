import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:website_frontend/models/ehrenmitglied.dart';

class EhrenMitgliederProvider with ChangeNotifier {
  final List<EhrenMitglied> ehrenMitglieder = [];

  List<EhrenMitglied> get allEhrenMitglieder {
    ehrenMitglieder.sort((a, b) => a.name.compareTo(b.name));
    return List.from(ehrenMitglieder);
  }

  List<EhrenMitglied> get allAktivEhrenMitglieder {
    List<EhrenMitglied> aktivEhrenmitglieder = [];
    aktivEhrenmitglieder = ehrenMitglieder
        .where((element) => element.isAktivEhrenMitglied == true)
        .toList();
    aktivEhrenmitglieder.sort((a, b) => a.name.compareTo(b.name));
    return List.from(aktivEhrenmitglieder);
  }

  List<EhrenMitglied> get allNichtAktivEhrenMitglieder {
    List<EhrenMitglied> aktivEhrenmitglieder = [];
    aktivEhrenmitglieder = ehrenMitglieder
        .where((element) => element.isAktivEhrenMitglied == false)
        .toList();
    aktivEhrenmitglieder.sort((a, b) => a.name.compareTo(b.name));
    return List.from(aktivEhrenmitglieder);
  }

  List<EhrenMitglied> ehrenMitgliedFromJson(String str) =>
      List<EhrenMitglied>.from(
        json
                .decode(str)
                .map((x) => EhrenMitglied.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>,
      );

  Future<void> readEhrenMitgliederJson() async {
    final String response =
        await rootBundle.loadString('assets/jsons/ehrenmitglieder.json');
    if (ehrenMitglieder.isEmpty) {
      ehrenMitglieder.addAll(ehrenMitgliedFromJson(response));
    }
  }
}
