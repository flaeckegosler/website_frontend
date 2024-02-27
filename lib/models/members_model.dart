import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';

class Member with ChangeNotifier {
  final String firstName;
  final String lastName;
  final String pictureUrl;
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
    required this.instrument,
    required this.vorstand,
    required this.expedition,
    required this.oktoberfest,
    required this.muKo,
    required this.sujetKommission,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      firstName: json['member_firstname'] as String,
      lastName: json['member_lastname'] as String,
      pictureUrl: apiUrl + json['member_image'],
      instrument: json['member_instrument'] as String,
      vorstand: json['member_vorstand'] as String,
      expedition: json['member_expedition'] as String,
      oktoberfest: json['member_oktoberfest'] as String,
      muKo: json['member_muko'] as String,
      sujetKommission: json['member_sujetkommission'] as String,
    );
  }
}
