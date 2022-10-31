import 'package:flutter/material.dart';

class EhrenMitglied with ChangeNotifier {
  final String firstName;
  final String lastName;
  final String town;
  final String? recognationYear;
  final bool aktivEhrenMitglied;

  EhrenMitglied({
    required this.firstName,
    required this.lastName,
    required this.town,
    this.recognationYear,
    required this.aktivEhrenMitglied,
  });
}
