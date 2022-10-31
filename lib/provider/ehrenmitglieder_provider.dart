import 'package:flutter/material.dart';
import 'package:website_frontend/models/ehrenmitglied.dart';

class EhrenMitgliederProvider with ChangeNotifier {
  final List<EhrenMitglied> _ehrenMitglieder = [];

  List<EhrenMitglied> get allEhrenMitglieder {
    _ehrenMitglieder.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_ehrenMitglieder);
  }

  void createMembers() {
    if (_ehrenMitglieder.isEmpty) {
      _ehrenMitglieder.add(
        EhrenMitglied(
          aktivEhrenMitglied: true,
          firstName: "Carmen",
          lastName: "Andermatt",
          town: "Luzern",
          recognationYear: "2023",
        ),
      );

      _ehrenMitglieder.add(
        EhrenMitglied(
          aktivEhrenMitglied: true,
          firstName: "Marco",
          lastName: "Andermatt",
          town: "Rothenburg",
          recognationYear: "2023",
        ),
      );

      _ehrenMitglieder.add(
        EhrenMitglied(
          aktivEhrenMitglied: true,
          firstName: "André",
          lastName: "Aregger",
          town: "Rothenburg",
          recognationYear: "-",
        ),
      );
    }
  }
}
