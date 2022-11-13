import 'package:flutter/material.dart';

class Vorstand with ChangeNotifier {
  final String jahr;
  final String praesident;
  final String tambourmajor;
  final String vizePraesident;
  final String kassier;
  final String sujetchef;
  final String materialverwalter;
  final String aktuar;
  final String sujet;

  Vorstand({
    required this.jahr,
    required this.praesident,
    required this.tambourmajor,
    required this.vizePraesident,
    required this.kassier,
    required this.sujetchef,
    required this.materialverwalter,
    required this.aktuar,
    required this.sujet,
  });

  factory Vorstand.fromJson(Map<String, dynamic> json) => Vorstand(
        jahr: json["Jahr"],
        praesident: json["Präsident"],
        tambourmajor: json["Tambourmajor"],
        vizePraesident: json["Vize-Präsident"],
        kassier: json["Kassier"],
        sujetchef: json["Sujetchef"],
        materialverwalter: json["Materialverwalter"],
        aktuar: json["Aktuar"],
        sujet: json["Sujet"],
      );
}
