import 'package:flutter/material.dart';
import 'package:website_frontend/models/members_model.dart';

class MemberProvider with ChangeNotifier {
  final List<Member> _member = [];

  List<Member> get allMembers {
    _member.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_member);
  }

  List<Member> getMemberOfInstrument(String instrument) {
    final List<Member> _instrument = [];
    for (final element in _member) {
      if (element.instrument == instrument) {
        _instrument.add(element);
      }
    }
    _instrument.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_instrument);
  }

  List<Member> getMemberOfVorstand() {
    final List<Member> _vorstand = [];
    for (final element in _member) {
      if (element.vorstand != "") {
        _vorstand.add(element);
      }
    }
    _vorstand.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_vorstand);
  }

  List<Member> getMemberOfExpedition() {
    final List<Member> _expedition = [];
    for (final element in _member) {
      if (element.expedition != "") {
        _expedition.add(element);
      }
    }
    _expedition.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_expedition);
  }

  List<Member> getMemberOfSujetkommission() {
    final List<Member> _sujetKommission = [];
    for (final element in _member) {
      if (element.sujetKommission != "") {
        _sujetKommission.add(element);
      }
    }
    _sujetKommission.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_sujetKommission);
  }

  List<Member> getMemberOfMuKo() {
    final List<Member> _muKo = [];
    for (final element in _member) {
      if (element.muKo != "") {
        _muKo.add(element);
      }
    }
    _muKo.sort((a, b) => a.lastName.compareTo(b.lastName));
    return List.from(_muKo);
  }

  void createMembers() {
    if (_member.isEmpty) {
      _member.add(
        Member(
            firstName: "Raphael",
            lastName: "Koch",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2523/raphael_koch.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2523/raphael_koch.jpg",
            instrument: "Horn",
            vorstand: "",
            expedition: "",
            muKo: "Aktuar",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Yannick",
            lastName: "Egli",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1944/yannickegli.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1944/yannickegli.jpg",
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
                "https://flaeckegosler.ch/site/assets/files/2110/janick_lang-1.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2110/janick_lang-1.420x0.jpg",
            instrument: "Drums",
            vorstand: "Präsident",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );
      _member.add(
        Member(
            firstName: "Oliver",
            lastName: "Schürch",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1066/oliver_schurch.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1066/oliver_schurch.jpg",
            instrument: "Tambi",
            vorstand: "Tambourmajor",
            expedition: "",
            muKo: "Tambourmajor",
            sujetKommission: ""),
      );
      _member.add(
        Member(
            firstName: "Alex",
            lastName: "Vogel",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2273/alex_vogel.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2273/alex_vogel.420x0.jpg",
            instrument: "Trompete",
            vorstand: "Kassier",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Alina",
            lastName: "Orsi",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2482/16452899684114946276611766015906.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2482/16452899684114946276611766015906.420x0.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Carla",
            lastName: "Fuchs",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2114/carla_fuchs.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2114/carla_fuchs.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Chantal",
            lastName: "Fischer",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2480/img-20220219-wa0007.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2480/img-20220219-wa0007.420x0.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Damian",
            lastName: "Zurmühle",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2275/damian_zurmuhle.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2275/damian_zurmuhle.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Joanna",
            lastName: "Zemp",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2483/16452896202434578746414091912680.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2483/16452896202434578746414091912680.420x0.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Julia",
            lastName: "Lipp",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2481/16452898967475335831440091871298.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2481/16452898967475335831440091871298.420x0.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );
      _member.add(
        Member(
            firstName: "Lukas",
            lastName: "Lang",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1076/lukas_lang.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1076/lukas_lang.420x0.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "Beisitzer",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Marco",
            lastName: "Schriber",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1080/marco_schriber.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1080/marco_schriber.420x0.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "Festwirtschaft",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Martin",
            lastName: "Richli",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2284/martin_richli.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2284/martin_richli.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "Vize-Tambi",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Maurin",
            lastName: "Steiger",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2270/maurin_steiger.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2270/maurin_steiger.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Nick",
            lastName: "Leber",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2400/dsc06051.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2400/dsc06051.jpg",
            instrument: "Trompete",
            vorstand: "Aktuar",
            expedition: "Aktuar",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Nick",
            lastName: "Schwarzenberger",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1949/nick_schwarzenberger.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1949/nick_schwarzenberger.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Patrick",
            lastName: "Vogel",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2272/patrick_vogel.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2272/patrick_vogel.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "MUKO-Präsident",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Philippe",
            lastName: "Schenker",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1079/philippe_schenker.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1079/philippe_schenker.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Ramona",
            lastName: "La Colla",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1075/ramona_la_colla.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1075/ramona_la_colla.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: "Grind"),
      );

      _member.add(
        Member(
            firstName: "Sibille",
            lastName: "Brunner",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2274/sibille_brunner.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2274/sibille_brunner.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Silvia",
            lastName: "Krummenacher",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2484/16452897699215684303164215610438.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2484/16452897699215684303164215610438.420x0.jpg",
            instrument: "Trompete",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Chiara",
            lastName: "Köchli",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1961/chiara_kochli.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1961/chiara_kochli.jpg",
            instrument: "Posaune",
            vorstand: "Vize-Präsidentin",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Daniela",
            lastName: "Hotz",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1100/daniela_hotz.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1100/daniela_hotz.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Fabian",
            lastName: "Benz",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2054/fabian_benz.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2054/fabian_benz.420x0.jpg",
            instrument: "Sousaphon",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: "Wagenbau"),
      );

      _member.add(
        Member(
            firstName: "Fabio",
            lastName: "Roos",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2055/fabio_roos.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2055/fabio_roos.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Gabriel",
            lastName: "Graf",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2276/gabu.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2276/gabu.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Lorena",
            lastName: "Lang",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2277/lorenalang.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2277/lorenalang.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "Marketing",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Lukas",
            lastName: "Dünki",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1089/lukas_dunki.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1089/lukas_dunki.420x0.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Michele",
            lastName: "Kritzer",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1094/dsc05898.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1094/dsc05898.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Nico",
            lastName: "Muschietti",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2056/nico_muschietti.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2056/nico_muschietti.420x0.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Noah",
            lastName: "Berwert",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2111/noah_berwert.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2111/noah_berwert.420x0.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );
      _member.add(
        Member(
            firstName: "Oliver",
            lastName: "Köchli",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2278/16452911702394712349943898148741.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2278/16452911702394712349943898148741.420x0.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Raphael",
            lastName: "Scheidegger",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1097/raphael_scheidegger.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1097/raphael_scheidegger.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Reto",
            lastName: "Bättig",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1088/reto_battig.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1088/reto_battig.420x0.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Andrea",
            lastName: "Mattmann",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1108/andrea_mattmann.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1108/andrea_mattmann.jpg",
            instrument: "Horn",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Fabian",
            lastName: "Koch",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1103/fabian_koch.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1103/fabian_koch.jpg",
            instrument: "Horn",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Justin",
            lastName: "Faesi",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1943/justinfaesi.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1943/justinfaesi.jpg",
            instrument: "Horn",
            vorstand: "",
            expedition: "Bau/Logistik",
            muKo: "",
            sujetKommission: "Grind"),
      );

      _member.add(
        Member(
            firstName: "Markus",
            lastName: "Studer",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1106/markus_studer.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1106/markus_studer.420x0.jpg",
            instrument: "Horn",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );
      _member.add(
        Member(
            firstName: "Raphaela",
            lastName: "Zimmermann",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2521/16452896833671721955893723840724.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2521/16452896833671721955893723840724.420x0.jpg",
            instrument: "Posaune",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Diego",
            lastName: "Zimmermann",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1942/diego_zimmermann.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1942/diego_zimmermann.420x0.jpg",
            instrument: "Sousaphon",
            vorstand: "Sujet-Chef",
            expedition: "",
            muKo: "",
            sujetKommission: "Sujetchef"),
      );

      _member.add(
        Member(
            firstName: "Joel",
            lastName: "Zurmühle",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1115/joel_zurmuhle.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1115/joel_zurmuhle.jpg",
            instrument: "Sousaphon",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Lukas",
            lastName: "Studer",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1116/lukas_studer.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1116/lukas_studer.420x0.jpg",
            instrument: "Sousaphon",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Marco",
            lastName: "Andermatt",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1117/marco_andermatt.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1117/marco_andermatt.420x0.jpg",
            instrument: "Sousaphon",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Patrick",
            lastName: "Roos",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1112/patrick_roos.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1112/patrick_roos.jpg",
            instrument: "Sousaphon",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Domenik",
            lastName: "Bucher",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2280/domenik.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2280/domenik.jpg",
            instrument: "Drums",
            vorstand: "",
            expedition: "OK-Präsident Stv.",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Joel",
            lastName: "Bisang",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2281/joelbisang.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2281/joelbisang.jpg",
            instrument: "Drums",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: "Grind"),
      );

      _member.add(
        Member(
            firstName: "Kay",
            lastName: "Wicki",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1952/kay_wicki-1.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1952/kay_wicki-1.420x0.jpg",
            instrument: "Drums",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Luis",
            lastName: "Blunschi",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1127/whatsapp_image_2022-01-30_at_21_46_28.280x0.jpeg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1127/whatsapp_image_2022-01-30_at_21_46_28.jpeg",
            instrument: "Drums",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Manuel",
            lastName: "Mühlebach",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1125/manuel_muhlebach-1.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1125/manuel_muhlebach-1.420x0.jpg",
            instrument: "Drums",
            vorstand: "Matierialverwalter",
            expedition: "",
            muKo: "Schlag-Chef",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Pascal",
            lastName: "Huber",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/2198/pascal_huber-1.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/2198/pascal_huber-1.420x0.jpg",
            instrument: "Drums",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );

      _member.add(
        Member(
            firstName: "Sebastian",
            lastName: "Moos",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1123/sebastian_moos-1.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1123/sebastian_moos-1.420x0.jpg",
            instrument: "Drums",
            vorstand: "",
            expedition: "OK-Präsident",
            muKo: "",
            sujetKommission: ""),
      );
      _member.add(
        Member(
            firstName: "Sven",
            lastName: "Lötscher",
            pictureUrl:
                "https://flaeckegosler.ch/site/assets/files/1939/sven_lotscher-1.280x0.jpg",
            pictureUrlMax:
                "https://flaeckegosler.ch/site/assets/files/1939/sven_lotscher.jpg",
            instrument: "Drums",
            vorstand: "",
            expedition: "",
            muKo: "",
            sujetKommission: ""),
      );
    }
  }
}
