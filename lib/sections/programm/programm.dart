import 'package:flutter/material.dart';
import 'package:website_frontend/components/section_title.dart';

class ProgrammSection extends StatefulWidget {
  @override
  _SoundSectionState createState() => _SoundSectionState();
}

class _SoundSectionState extends State<ProgrammSection> {
  @override
  void initState() {
    super.initState();
  }

  TextStyle sujetFontProgramm = const TextStyle(
    fontFamily: 'Impact',
    color: Colors.white,
    fontSize: 18,
  );

  Color color2 = const Color.fromRGBO(172, 80, 48, 1);

  FittedBox getProgrammRow(String zeit, String ort) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 60,
            child: Text(
              zeit,
              style: sujetFontProgramm,
            ),
          ),
          Text(
            "$ort  ",
            style: sujetFontProgramm,
          ),
        ],
      ),
    );
  }

  ClipRRect thursday() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "SCHMUDO 8. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '04:00',
              'Tagwache (intern)',
            ),
            getProgrammRow(
              '05:00',
              "Urknall + Tagwache, Flecken R’burg",
            ),
            getProgrammRow(
              '06:45',
              'Fasnachtszmorge,	Pfarreiheim',
            ),
            getProgrammRow(
              '09:00',
              'Fleckenkonzert, Flecken R’burg',
            ),
            getProgrammRow(
              '10:45',
              'Ständli Pistor, Rothenburg',
            ),
            getProgrammRow(
              '14:00',
              'Luzerner Umzug (Nr. 17), Luzern',
            ),
            getProgrammRow(
              '19:15',
              "Monsterkonzert, Flecken R’burg",
            ),
            getProgrammRow(
              '22:45',
              "Auftritt Pfarreiheim, R’burg",
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect friday() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        color: color2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "FASNACHTS-FRIITIG 9. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '11:00',
              'Schnebe-Frühstück (intern)',
            ),
            getProgrammRow(
              '13:00',
              "Ständli Rank, Rothenburg",
            ),
            getProgrammRow(
              '14:00',
              "Ständli Raiffeisenbank, Rothenburg",
            ),
            getProgrammRow(
              '15:30',
              'Ständli Landi, Rothenburg',
            ),
            getProgrammRow(
              'Abend',
              'Gönneranlass	Pfarreiheim, Rothenburg',
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect saturday() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "FLÄTTERE-SAMSCHTIG 10. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '12:30',
              'Auftritt Mühlenplatz, Luzern',
            ),
            getProgrammRow(
              '16:00',
              'Auftritt Jesuitenplatz, Luzern',
            ),
            getProgrammRow(
              'Abend',
              'Raguball (Auftritt 23 Uhr), Rain',
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect sunday() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        color: color2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "FASNACHTS-SONNTIG 11. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '10:00',
              "Fasnachtsgottesdienst, Pfarrkirche",
            ),
            getProgrammRow(
              '14:00',
              'Umzug Emmen',
            ),
            getProgrammRow(
              '23:00',
              'Auftritt Ämmer Fasnacht',
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect monday() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "GÜDIS-MÄNTIG 12. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '10:30',
              "Gässle, Luzern",
            ),
            getProgrammRow(
              '14:00',
              'Luzerner Umzug (Nr. 17), Luzern',
            ),
            getProgrammRow(
              '17:30',
              'Auftritt Schweizerhof, Luzern',
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect tuesday() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        color: color2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "GÜDIS-ZIISCHTIG 13. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Impact',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '11:00',
              "Mittagessen mit Goldies (intern)",
            ),
            getProgrammRow(
              '14:00',
              "Kinderumzug, Rothenburg",
            ),
            getProgrammRow(
              'Abend',
              'Gässle, Luzern',
            ),
            getProgrammRow(
              '00:00',
              'Auftritt Falkenplatz, Luzern',
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(230, 230, 230, 1),
      child: Align(
        child: Container(
          width: 1250,
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 10),
                child: SectionTitle(
                  title: "Programm",
                  subTitle: "Komm vorbei!",
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (MediaQuery.of(context).size.width < 1100)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      thursday(),
                      const SizedBox(
                        height: 25,
                      ),
                      friday(),
                      const SizedBox(
                        height: 25,
                      ),
                      saturday(),
                      const SizedBox(
                        height: 25,
                      ),
                      sunday(),
                      const SizedBox(
                        height: 25,
                      ),
                      monday(),
                      const SizedBox(
                        height: 25,
                      ),
                      tuesday(),
                    ],
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 500,
                      child: Column(
                        children: [
                          thursday(),
                          const SizedBox(
                            height: 20,
                          ),
                          friday(),
                          const SizedBox(
                            height: 20,
                          ),
                          saturday(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: Column(
                        children: [
                          sunday(),
                          const SizedBox(
                            height: 20,
                          ),
                          monday(),
                          const SizedBox(
                            height: 20,
                          ),
                          tuesday(),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
