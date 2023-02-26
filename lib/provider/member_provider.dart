import 'package:flutter/material.dart';
import 'package:website_frontend/models/members_model.dart';

class MemberProvider with ChangeNotifier {
  final List<Member> _member = [];

  List<Member> get allMembers {
    _member.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_member);
  }

  String getPictureLink(firstName, lastName) {
    return _member
        .firstWhere(
          (element) =>
              element.firstName.toString().toLowerCase() == firstName &&
              element.lastName.toString().toLowerCase() == lastName,
        )
        .pictureUrlMax;
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

  void createMembers() {
    if (_member.isEmpty) {
      _member.add(
        Member(
          firstName: "Cedric (Kandidat)",
          lastName: "Egli",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/e_cedric_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Silja (Kandidatin)",
          lastName: "Graf",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/g_silja_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Jasmina (Kandidatin)",
          lastName: "Hartenstein",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/h_jasmina_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Fabio (Kandidat)",
          lastName: "Wettstein",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/w_fabio_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Adrian (Kandidat)",
          lastName: "Muschietti",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/m_adrian_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Pascal (Kandidat)",
          lastName: "Rachow",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/r_pascal_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Manuela (Kandidatin)",
          lastName: "Najer",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/n_manuela_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Andri (Kandidat)",
          lastName: "Wigger",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/w_andri_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Joel (Kandidat)",
          lastName: "Zeier",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/z_joel_360kb.jpg",
          pictureUrlMax: "assets/bild_kandidaten.png",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Raphael",
          lastName: "Koch",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/k_raphael_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/raphael_koch.jpg",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "Aktuar",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Yannick",
          lastName: "Egli",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/e_yannick_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/yannickegli.jpg",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Janick",
          lastName: "Lang",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/l_janick_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2110/janick_lang-1.420x0.jpg",
          instrument: "Drums",
          vorstand: "Präsident",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );
      _member.add(
        Member(
          firstName: "Oliver",
          lastName: "Schürch",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/s_oliver_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/oliver_schurch.jpg",
          instrument: "Tambi",
          vorstand: "Tambourmajor",
          expedition: "",
          muKo: "Tambourmajor",
          sujetKommission: "",
        ),
      );
      _member.add(
        Member(
          firstName: "Alex",
          lastName: "Vogel",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/v_alex_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2273/alex_vogel.420x0.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Alina",
          lastName: "Orsi",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/o_alina_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/o_alina.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Carla",
          lastName: "Fuchs",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/f_carla_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2114/carla_fuchs.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Chantal",
          lastName: "Fischer",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/f_chantal_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2480/img-20220219-wa0007.420x0.jpg",
          instrument: "Trompete",
          vorstand: "Vize-Präsidentin",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Damian",
          lastName: "Zurmühle",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/z_damian_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2275/damian_zurmuhle.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Julia",
          lastName: "Lipp",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/l_julia_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2481/16452898967475335831440091871298.420x0.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );
      _member.add(
        Member(
          firstName: "Lukas",
          lastName: "Lang",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/l_lukas_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/l_lukas.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "Beisitzer",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Marco",
          lastName: "Schriber",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/s_marco_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1080/marco_schriber.420x0.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Martin",
          lastName: "Richli",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/r_martin_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2284/martin_richli.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "Vize-Tambi",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Maurin",
          lastName: "Steiger",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/s_maurin_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2270/maurin_steiger.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "Grind",
        ),
      );

      _member.add(
        Member(
          firstName: "Nick",
          lastName: "Leber",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/l_nick_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2400/dsc06051.jpg",
          instrument: "Trompete",
          vorstand: "Aktuar",
          expedition: "Aktuar",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Nick",
          lastName: "Schwarzenberger",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/s_nick_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/s_nick.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Patrick",
          lastName: "Vogel",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/v_patrick_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2272/patrick_vogel.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "MUKO-Präsident",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Philippe",
          lastName: "Schenker",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/s_philippe_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/philippe_schenker.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Ramona",
          lastName: "La Colla",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/l_ramona_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/l_ramona.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "Grind",
        ),
      );

      _member.add(
        Member(
          firstName: "Sibille",
          lastName: "Zurmühle",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/z_sibille_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/z_sibille.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Silvia",
          lastName: "Krummenacher",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/k_silvia_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2484/16452897699215684303164215610438.420x0.jpg",
          instrument: "Trompete",
          vorstand: "",
          expedition: "Festwirtschaft",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Chiara",
          lastName: "Köchli",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/k_chiara_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1961/chiara_kochli.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Daniela",
          lastName: "Hotz",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/h_daniela_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1100/daniela_hotz.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Fabian",
          lastName: "Benz",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/b_fabian_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2054/fabian_benz.420x0.jpg",
          instrument: "Sousaphon",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "Wagenbau",
        ),
      );

      _member.add(
        Member(
          firstName: "Fabio",
          lastName: "Roos",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/r_fabio_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2055/fabio_roos.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Lorena",
          lastName: "Lang",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/l_lorena_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2277/lorenalang.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "Marketing",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Lukas",
          lastName: "Dünki",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/d_lukas_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1089/lukas_dunki.420x0.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Michele",
          lastName: "Kritzer",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/k_michele_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1094/dsc05898.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Nico",
          lastName: "Muschietti",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/m_nico_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2056/nico_muschietti.420x0.jpg",
          instrument: "Posaune",
          vorstand: "Kassier",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Oliver",
          lastName: "Köchli",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/k_oliver_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2278/16452911702394712349943898148741.420x0.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Raphael",
          lastName: "Scheidegger",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/s_raphael_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1097/raphael_scheidegger.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Reto",
          lastName: "Bättig",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/b_reto_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1088/reto_battig.420x0.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Andrea",
          lastName: "Mattmann",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/m_andrea_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1108/andrea_mattmann.jpg",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Fabian",
          lastName: "Koch",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/k_fabian_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1103/fabian_koch.jpg",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Justin",
          lastName: "Faesi",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/f_justin_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1943/justinfaesi.jpg",
          instrument: "Horn",
          vorstand: "",
          expedition: "Bau/Logistik",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Markus",
          lastName: "Studer",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/s_markus_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1106/markus_studer.420x0.jpg",
          instrument: "Horn",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );
      _member.add(
        Member(
          firstName: "Raphaela",
          lastName: "Köchli",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/k_raphaela_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2521/16452896833671721955893723840724.420x0.jpg",
          instrument: "Posaune",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Diego",
          lastName: "Zimmermann",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/z_diego_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1942/diego_zimmermann.420x0.jpg",
          instrument: "Sousaphon",
          vorstand: "Sujet-Chef",
          expedition: "",
          muKo: "",
          sujetKommission: "Sujetchef",
        ),
      );

      _member.add(
        Member(
          firstName: "Joel",
          lastName: "Zurmühle",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/zu_joel_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/zu_joel.jpg",
          instrument: "Sousaphon",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Lukas",
          lastName: "Studer",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/s_lukas_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1116/lukas_studer.420x0.jpg",
          instrument: "Sousaphon",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Marco",
          lastName: "Andermatt",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/a_marco_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/27/a_marco.jpg",
          instrument: "Sousaphon",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Patrick",
          lastName: "Roos",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/r_patrick_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1112/patrick_roos.jpg",
          instrument: "Sousaphon",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Domenik",
          lastName: "Bucher",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/b_domenik_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2280/domenik.jpg",
          instrument: "Drums",
          vorstand: "",
          expedition: "OK-Präsident Stv.",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Joel",
          lastName: "Bisang",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/b_joel_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2281/joelbisang.jpg",
          instrument: "Drums",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "Grind",
        ),
      );

      _member.add(
        Member(
          firstName: "Kay",
          lastName: "Wicki",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/w_kay_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1952/kay_wicki-1.420x0.jpg",
          instrument: "Drums",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Luis",
          lastName: "Blunschi",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/b_luis_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1127/whatsapp_image_2022-01-30_at_21_46_28.jpeg",
          instrument: "Drums",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Manuel",
          lastName: "Mühlebach",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/m_manuel_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1125/manuel_muhlebach-1.420x0.jpg",
          instrument: "Drums",
          vorstand: "Materialverwalter",
          expedition: "",
          muKo: "Schlag-Chef",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Pascal",
          lastName: "Huber",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/h_pascal_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/2198/pascal_huber-1.420x0.jpg",
          instrument: "Drums",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );

      _member.add(
        Member(
          firstName: "Sebastian",
          lastName: "Moos",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/m_sebastian_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1123/sebastian_moos-1.420x0.jpg",
          instrument: "Drums",
          vorstand: "",
          expedition: "OK-Präsident",
          muKo: "",
          sujetKommission: "",
        ),
      );
      _member.add(
        Member(
          firstName: "Sven",
          lastName: "Lötscher",
          pictureUrl:
              "https://api.flaeckegosler.ch/site/assets/files/mitglieder/l_sven_360kb.jpg",
          pictureUrlMax:
              "https://api.flaeckegosler.ch/site/assets/files/1939/sven_lotscher.jpg",
          instrument: "Drums",
          vorstand: "",
          expedition: "",
          muKo: "",
          sujetKommission: "",
        ),
      );
    }
  }
}
