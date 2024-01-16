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
    fontFamily: 'Shakuro',
    color: Colors.white,
    fontSize: 18,
  );

  Color color1 = const Color.fromRGBO(165, 102, 19, 1);
  Color color2 = const Color.fromRGBO(121, 28, 28, 1);

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
                "SCHMUDO 16. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Shakuro',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '04:00',
              'TagwaChE (intErn)',
            ),
            getProgrammRow(
              '05:00',
              "Urknall + TagwaChE, FlECkEn R’BURG",
            ),
            getProgrammRow(
              '06:45',
              'FasnaChtsZmorgE,	PfarrEihEim',
            ),
            getProgrammRow(
              '09:00',
              'FlECkEnkonZErt, FLECKEN R’BURG',
            ),
            getProgrammRow(
              '10:45',
              'Ständli Pistor, RothEnburg',
            ),
            getProgrammRow(
              '14:00',
              'LuZErnEr UmZug (Nr. 17), LuZErn',
            ),
            getProgrammRow(
              'Abend',
              "MonstErkonZErt, FlECkEn R’BURG",
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
                "FASNACHTS-FRIITIG 17. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Shakuro',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '11:00',
              'SChnEbE-FrühstüCk (intErn)',
            ),
            getProgrammRow(
              '13:00',
              "Ständli Rank, RothEnburg",
            ),
            getProgrammRow(
              '14:00',
              "Ständli RaiffEisEnbank, RothEnburg",
            ),
            getProgrammRow(
              '15:30',
              'Ständli Landi, RothEnburg',
            ),
            getProgrammRow(
              'AbEnd',
              'GönnEranlass	PfarrEihEim, RothEnburg ',
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
                "FLÄTTERE-SAMSCHTIG 18. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Shakuro',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '12:30',
              'Auftritt MÜHLENPLATZ, LuZErn',
            ),
            getProgrammRow(
              '16:00',
              'Auftritt JEsuitEnplatZ, LuZERN',
            ),
            getProgrammRow(
              'AbEnd',
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
                "FASNACHTS-SONNTIG 19. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Shakuro',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '10:00',
              "FasnaChtsgottEsdiEnst, PfarrkirChE",
            ),
            getProgrammRow(
              '14:00',
              'UMZUG Emmen',
            ),
            getProgrammRow(
              'AbEnd',
              'Ämmer Fasnacht',
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
                "GÜDIS-MÄNTIG 20. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Shakuro',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '10:30',
              "GässlE, LuZErn",
            ),
            getProgrammRow(
              '14:00',
              'LuZErnEr UmZug (Nr. 17), LuZErn',
            ),
            getProgrammRow(
              '17:30',
              'AUFTRITT SCHWEIZERHOF, LuZErn',
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
                "GÜDIS-ZIISCHTIG 21. FEBRUAR",
                style: TextStyle(
                  fontFamily: 'Shakuro',
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            getProgrammRow(
              '11:00',
              "Mittagessen mit Goldies (intErn)",
            ),
            getProgrammRow(
              '14:00',
              "KindErumZug, RothEnburg",
            ),
            getProgrammRow(
              'AbEnd',
              'GässlE, LuZErn',
            ),
            getProgrammRow(
              '00:00',
              'Auftritt Falkenplatz, LuZErn',
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
                  subTitle: "Komm vorbEi!",
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
