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
  Color color2 = Color.fromRGBO(121, 28, 28, 1);

  Row getProgrammRow(String zeit, String ort) {
    return Row(
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
          ort,
          style: sujetFontProgramm,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      // color: const Color.fromRGBO(230, 230, 230, 1),
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
                  title: "Programm 2023",
                  subTitle: "Komm vorbei!",
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (MediaQuery.of(context).size.width < 750)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ColoredBox(
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
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
                                '10:30',
                                'Ständli Pistor, RothEnburg',
                              ),
                              getProgrammRow(
                                '14:00',
                                'LuZErnEr UmZug (Nr. 30), LuZErn',
                              ),
                              getProgrammRow(
                                'Abend',
                                "MonstErkonZErt, FlECkEn R’BURG",
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ColoredBox(
                          color: color2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
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
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ColoredBox(
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
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
                                'Auftritt MÜHLENPLATZ, luZErn',
                              ),
                              getProgrammRow(
                                '13:00',
                                "gässlE, luZErn",
                              ),
                              getProgrammRow(
                                '14:00',
                                'Auftritt JEsuitEnplatZ, LuZERN',
                              ),
                              getProgrammRow(
                                '15:00',
                                'Ständli AmEisiZunft, LöwEngrabEn',
                              ),
                              getProgrammRow(
                                'AbEnd',
                                'Raguball (Auftritt 23 Uhr), Rain',
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ColoredBox(
                          color: color2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
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
                                'UMZUG INWIL, ansChl. dörflifasnaCht',
                              ),
                              getProgrammRow(
                                'AbEnd',
                                'BElCantos Ball (Auftritt 23 Uhr), BAAR',
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ColoredBox(
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
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
                                '10:00',
                                "GässlE, LuZErn",
                              ),
                              getProgrammRow(
                                '14:00',
                                'LuZErnEr UmZug (Nr. 30), LuZErn',
                              ),
                              getProgrammRow(
                                '18:15',
                                'AUFTRITT SCHWEIZERHOF, LuZErn',
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ColoredBox(
                          color: color2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
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
                                '14:00',
                                "KindErumZug, RothEnburg",
                              ),
                              getProgrammRow(
                                '20:00',
                                'Auftritt JEsuitEnplatZ, LuZErn',
                              ),
                              getProgrammRow(
                                'AbEnd',
                                'GässlE, LuZErn',
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Column(
                  children: [],
                ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
