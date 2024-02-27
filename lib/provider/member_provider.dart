import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/models/members_model.dart';

class MemberProvider with ChangeNotifier {
  late List<Member> _member = [];

  List<Member> get allMembers {
    _member.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_member);
  }

  String getPictureLink(firstName, lastName) {
    return _member
        .firstWhere(
          (element) =>
              element.firstName.toLowerCase() == firstName &&
              element.lastName.toLowerCase() == lastName,
        )
        .pictureUrl;
  }

  List<Member> getMemberOfInstrument(String instrument2) {
    final List<Member> instrument = [];
    for (final element in _member) {
      if (element.instrument == instrument2) {
        instrument.add(element);
      }
    }
    instrument.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(instrument);
  }

  List<Member> getMemberOfVorstand() {
    final List<Member> vorstand = [];
    for (final element in _member) {
      if (element.vorstand != "") {
        vorstand.add(element);
      }
    }
    vorstand.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(vorstand);
  }

  List<Member> getMemberOfExpedition() {
    final List<Member> expedition = [];
    for (final element in _member) {
      if (element.expedition != "") {
        expedition.add(element);
      }
    }
    expedition.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(expedition);
  }

  List<Member> getMemberOfOktoberfest() {
    final List<Member> oktoberfest = [];
    for (final element in _member) {
      if (element.oktoberfest != "") {
        oktoberfest.add(element);
      }
    }
    oktoberfest.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(oktoberfest);
  }

  List<Member> getMemberOfSujetkommission() {
    final List<Member> sujetKommission = [];
    for (final element in _member) {
      if (element.sujetKommission != "") {
        sujetKommission.add(element);
      }
    }
    sujetKommission.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(sujetKommission);
  }

  List<Member> getMemberOfMuKo() {
    final List<Member> muKo = [];
    for (final element in _member) {
      if (element.muKo != "") {
        muKo.add(element);
      }
    }
    muKo.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(muKo);
  }

  Future<void> fetchMembersData() async {
    final url = Uri.parse('https://api.flaeckegosler.ch/app/members-to-json/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData =
          json.decode(response.body) as Map<String, dynamic>;

      _member = jsonData.values.map((data) {
        return Member.fromJson(data as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('Failed to fetch members');
    }
  }
}
