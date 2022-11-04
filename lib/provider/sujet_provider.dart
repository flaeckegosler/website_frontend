import 'package:flutter/material.dart';
import 'package:website_frontend/models/sujet.dart';

class SujetProvider with ChangeNotifier {
  final List<Sujet> _sujet = [];

  List<Sujet> get allSujetsByYear {
    _sujet.sort((a, b) => b.jahr.compareTo(a.jahr));
    return List.from(_sujet);
  }

  void createMembers() {
    if (_sujet.isEmpty) {
      _sujet.add(
        Sujet(
          name: "Gründungsjahr 🥳",
          jahr: "1989",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Fläckegosler",
          jahr: "1990",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Reisefieber",
          jahr: "1991",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Orientalische Nächte",
          jahr: "1992",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Das finstere Mittelalter",
          jahr: "1993",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Lussie, das Ungeheuer der Luzerner Seebucht",
          jahr: "1994",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Visitors from Jupiter",
          jahr: "1995",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Killervirus",
          jahr: "1996",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Welcome to the jungle",
          jahr: "1997",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Design oder nicht sein",
          jahr: "1998",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Expedition eXotic",
          jahr: "1999",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Roborat - Pirat der Zukunft",
          jahr: "2000",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Magic Kingdom",
          jahr: "2001",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Döre be rot",
          jahr: "2002",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Swiss-ECHO",
          jahr: "2003",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Ziitreis",
          jahr: "2004",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Spieglein, Spieglein",
          jahr: "2005",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Goldrausch",
          jahr: "2006",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Fläckuarium",
          jahr: "2007",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Menschlich, Tierisch, Schottisch",
          jahr: "2008",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Goslergarde",
          jahr: "2009",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Potz di fort",
          jahr: "2010",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Röteborg",
          jahr: "2011",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Pilatusdrachen",
          jahr: "2012",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Genesis 2.0",
          jahr: "2013",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Bruderschaft",
          jahr: "2014",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Fläckinator - Eroberer fremder Galaxien",
          jahr: "2015",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Waldwächter",
          jahr: "2016",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Invasion Südpol",
          jahr: "2017",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Bluetsuger",
          jahr: "2018",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Diadamas",
          jahr: "2019",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Gosler Mythos",
          jahr: "2020",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Keine Fasnacht",
          jahr: "2021",
          vierzeiler: "-",
        ),
      );

      _sujet.add(
        Sujet(
          name: "Gosler Mythos",
          jahr: "2022",
          vierzeiler: "-",
        ),
      );
    }
  }
}
