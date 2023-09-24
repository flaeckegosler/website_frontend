import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Birthday with ChangeNotifier {
  final String firstName;
  final String lastName;
  final DateTime birthday;
  Birthday({
    required this.firstName,
    required this.lastName,
    required this.birthday,
  });

  // Define the date format
  static final dateFormat = DateFormat('dd.MM.yyyy');

  // Define the date format with German locale
  static final dateFormatPrintGerman = DateFormat('dd. MMMM', 'de_DE');

  factory Birthday.fromJson(Map<String, dynamic> json) => Birthday(
        firstName: json["Vorname"].toString(),
        lastName: json["Nachname"].toString(),
        birthday: dateFormat.parse(json["Gebdatum"].toString()),
      );

  String getFormattedBirthday() {
    return dateFormatPrintGerman.format(birthday);
  }
}
