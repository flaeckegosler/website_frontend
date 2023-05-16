// ignore_for_file: avoid_dynamic_calls, require_trailing_commas

import 'package:flutter/material.dart';

class EhrenMitglied with ChangeNotifier {
  final String name;
  final String ortschaft;
  final String anerkennungsjahr;
  final bool istAktivEhrenmitglied;

  EhrenMitglied({
    required this.name,
    required this.ortschaft,
    required this.anerkennungsjahr,
    required this.istAktivEhrenmitglied,
  });

  factory EhrenMitglied.fromJson(Map<String, dynamic> json) => EhrenMitglied(
        name: json["Name"].toString(),
        ortschaft: json["Ortschaft"].toString(),
        anerkennungsjahr: json["Anerkennungsjahr"].toString(),
        istAktivEhrenmitglied: json["istAktivEhrenmitglied"] as bool,
      );
}
