// ignore_for_file: avoid_dynamic_calls, require_trailing_commas

import 'package:flutter/material.dart';

class EhrenMitglied with ChangeNotifier {
  final String name;
  final String ortschaft;
  final String anerkennungsjahr;
  final bool isAktivEhrenMitglied;

  EhrenMitglied({
    required this.name,
    required this.ortschaft,
    required this.anerkennungsjahr,
    required this.isAktivEhrenMitglied,
  });

  factory EhrenMitglied.fromJson(Map<String, dynamic> json) => EhrenMitglied(
        name: json["Name"].toString(),
        ortschaft: json["Ortschaft"].toString(),
        anerkennungsjahr: json["Anerkennungsjahr"].toString(),
        isAktivEhrenMitglied: json["isAktivEhrenMitglied"] as bool,
      );
}
