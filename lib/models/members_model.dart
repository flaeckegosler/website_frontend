import 'package:flutter/material.dart';

class Member with ChangeNotifier {
  final String firstName;
  final String lastName;
  final String pictureUrl;
  final String pictureUrlMax;
  final String instrument;
  final String vorstand;
  final String expedition;
  final String oktoberfest;
  final String muKo;
  final String sujetKommission;

  Member({
    required this.firstName,
    required this.lastName,
    required this.pictureUrl,
    required this.pictureUrlMax,
    required this.instrument,
    required this.vorstand,
    required this.expedition,
    required this.oktoberfest,
    required this.muKo,
    required this.sujetKommission,
  });
}
