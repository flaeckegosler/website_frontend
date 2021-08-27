import 'package:flutter/material.dart';
import 'package:website_frontend/models/members_model.dart';

class MemberProvider with ChangeNotifier {
  final List<Member> _member = [];

  List<Member> get allMembers {
    _member.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_member);
  }

  void createMembers() {
    _member.add(
      Member(
          firstName: "Raphael",
          lastName: "Koch",
          pictureUrl:
              "https://flaeckegosler.ch/site/assets/files/2196/raphael_koch.140x0.jpg",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: ""),
    );

    _member.add(
      Member(
          firstName: "Yannick",
          lastName: "Egli",
          pictureUrl:
              "https://flaeckegosler.ch/site/assets/files/1944/yannickegli.140x0.jpg",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: ""),
    );

    _member.add(
      Member(
          firstName: "Janick",
          lastName: "Lang",
          pictureUrl:
              "https://flaeckegosler.ch/site/assets/files/2110/janick_lang-1.140x0.jpg",
          instrument: "Pauke",
          vorstand: "Präsident",
          expedition: "",
          muKo: "",
          sujetKommission: ""),
    );
  }
}
