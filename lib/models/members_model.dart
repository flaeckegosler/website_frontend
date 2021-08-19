import 'package:flutter/material.dart';

class Member with ChangeNotifier {
  final String firstName;
  final String lastName;
  final String pictureUrl;
  final String instrument;
  final String vorstand;
  final String expedition;
  final String muKo;
  final String sujetKommission;

  Member({
    required this.firstName,
    required this.lastName,
    required this.pictureUrl,
    required this.instrument,
    required this.vorstand,
    required this.expedition,
    required this.muKo,
    required this.sujetKommission,
  });
}
