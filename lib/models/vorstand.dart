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
        jahr: json["Jahr"].toString(),
        praesident: json["Präsident"].toString(),
        tambourmajor: json["Tambourmajor"].toString(),
        vizePraesident: json["Vize-Präsident"].toString(),
        kassier: json["Kassier"].toString(),
        sujetchef: json["Sujetchef"].toString(),
        materialverwalter: json["Materialverwalter"].toString(),
        aktuar: json["Aktuar"].toString(),
        sujet: json["Sujet"].toString(),
      );
}
