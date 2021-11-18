import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/members_model.dart';
import 'package:website_frontend/provider/member_provider.dart';

class MemberSection extends StatefulWidget {
  @override
  _MemberSectionState createState() => _MemberSectionState();
}

enum ButtonType {
  Instrumente,
  Kommissionen,
}

enum Picked_button_Instruments {
  trompete,
  posaune,
  horn,
  sousaphon,
  drums,
}

enum Picked_button_Kommissionen {
  vorstand,
  expedition,
  sujetkomission,
  musikkomission,
  wagenbau,
}

class _MemberSectionState extends State<MemberSection> {
  ButtonType buttonType = ButtonType.Instrumente;

  @override
  void initState() {
    super.initState();
    Provider.of<MemberProvider>(context, listen: false).createMembers();
  }

  Widget createMemberCard(Member member) {
    return Card(
      child: Stack(
        children: [
          Center(
            child: Image.network(
              member.pictureUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              member.firstName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.5, 2.5),
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 0, 0, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createMemberCardPremium(
      Member member, Picked_button_Kommissionen buttonType) {
    String aemtli = "";
    if (buttonType == Picked_button_Kommissionen.vorstand) {
      aemtli = member.vorstand;
    } else if (buttonType == Picked_button_Kommissionen.expedition) {
      aemtli = member.expedition;
    } else if (buttonType == Picked_button_Kommissionen.sujetkomission) {
      aemtli = member.sujetKommission;
    } else if (buttonType == Picked_button_Kommissionen.musikkomission) {
      aemtli = member.muKo;
    }
    return Card(
      child: Stack(
        children: [
          Center(
            child: Image.network(
              member.pictureUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.firstName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.5, 2.5),
                        blurRadius: 5.0,
                        color: Color.fromARGB(255, 0, 0, 1),
                      ),
                    ],
                  ),
                ),
                Text(
                  aemtli,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.5, 2.5),
                        blurRadius: 5.0,
                        color: Color.fromARGB(255, 0, 0, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Picked_button_Instruments pickedButtonInstrument =
      Picked_button_Instruments.drums;
  Picked_button_Kommissionen pickedButtonKommission =
      Picked_button_Kommissionen.vorstand;

  @override
  Widget build(BuildContext context) {
    final _myMemberProvider = context.watch<MemberProvider>();
    final double width = MediaQuery.of(context).size.width;

    List<Widget> getMemberList() {
      if (buttonType == ButtonType.Instrumente) {
        if (pickedButtonInstrument == Picked_button_Instruments.drums) {
          return List.generate(
              _myMemberProvider.getMemberOfInstrument("Drums").length,
              (index) => createMemberCard(
                  _myMemberProvider.getMemberOfInstrument("Drums")[index]));
        } else if (pickedButtonInstrument == Picked_button_Instruments.horn) {
          return List.generate(
              _myMemberProvider.getMemberOfInstrument("Horn").length,
              (index) => createMemberCard(
                  _myMemberProvider.getMemberOfInstrument("Horn")[index]));
        } else if (pickedButtonInstrument ==
            Picked_button_Instruments.sousaphon) {
          return List.generate(
              _myMemberProvider.getMemberOfInstrument("Sousaphon").length,
              (index) => createMemberCard(
                  _myMemberProvider.getMemberOfInstrument("Sousaphon")[index]));
        } else if (pickedButtonInstrument ==
            Picked_button_Instruments.trompete) {
          return List.generate(
              _myMemberProvider.getMemberOfInstrument("Trompete").length,
              (index) => createMemberCard(
                  _myMemberProvider.getMemberOfInstrument("Trompete")[index]));
        } else if (pickedButtonInstrument ==
            Picked_button_Instruments.posaune) {
          return List.generate(
              _myMemberProvider.getMemberOfInstrument("Posaune").length,
              (index) => createMemberCard(
                  _myMemberProvider.getMemberOfInstrument("Posaune")[index]));
        } else {
          return [];
        }
      } else {
        //ButtonType == Kommissionen
        if (pickedButtonKommission == Picked_button_Kommissionen.vorstand) {
          return List.generate(
              _myMemberProvider.getMemberOfVorstand().length,
              (index) => createMemberCardPremium(
                  _myMemberProvider.getMemberOfVorstand()[index],
                  Picked_button_Kommissionen.vorstand));
        } else if (pickedButtonKommission ==
            Picked_button_Kommissionen.expedition) {
          return List.generate(
              _myMemberProvider.getMemberOfExpedition().length,
              (index) => createMemberCardPremium(
                  _myMemberProvider.getMemberOfExpedition()[index],
                  Picked_button_Kommissionen.expedition));
        } else if (pickedButtonKommission ==
            Picked_button_Kommissionen.sujetkomission) {
          return List.generate(
              _myMemberProvider.getMemberOfSujetkommission().length,
              (index) => createMemberCardPremium(
                  _myMemberProvider.getMemberOfSujetkommission()[index],
                  Picked_button_Kommissionen.sujetkomission));
        } else if (pickedButtonKommission ==
            Picked_button_Kommissionen.musikkomission) {
          return List.generate(
              _myMemberProvider.getMemberOfMuKo().length,
              (index) => createMemberCardPremium(
                  _myMemberProvider.getMemberOfMuKo()[index],
                  Picked_button_Kommissionen.musikkomission));
        } else {
          return [];
        }
      }
    }

    int getCrossAxisCount() {
      if (width > 1000) {
        return 5;
      } else if (width > 750) {
        return 4;
      } else {
        return 3;
      }
    }

    return SizedBox(
      width: double.infinity,
      //color: const Color.fromRGBO(141, 66, 245, 1),
      child: Align(
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const SectionTitle(
                title: "Mitglieder",
                subTitle: "Sieh dies diese Beauties an!",
                color: Color.fromRGBO(147, 90, 161, 1),
              ),
              const SizedBox(
                height: 20,
              ),
              // Here comes the buttons
              memberButtonsResponsive(),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: getCrossAxisCount(),
                ),
                children: getMemberList(),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget memberButtonsResponsive() {
    double width = MediaQuery.of(context).size.width;
    if (width > 1000) {
      return Container(
        height: 60,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: buttonType == ButtonType.Instrumente
              ? instrumenteButtons()
              : kommissionenButtons(),
        ),
      );
    } else if (width > 520) {
      return Container(
        height: 120,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[0]
                else
                  kommissionenButtons()[0],
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[1]
                else
                  kommissionenButtons()[1],
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[2]
                else
                  kommissionenButtons()[2],
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[3]
                else
                  kommissionenButtons()[3],
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[4]
                else
                  kommissionenButtons()[4],
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[5]
                else
                  const SizedBox(
                    width: 160,
                    height: 40,
                  ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 180,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[0]
                else
                  kommissionenButtons()[0],
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[1]
                else
                  kommissionenButtons()[1],
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[2]
                else
                  kommissionenButtons()[2],
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[3]
                else
                  kommissionenButtons()[3],
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[4]
                else
                  kommissionenButtons()[4],
                if (buttonType == ButtonType.Instrumente)
                  instrumenteButtons()[5]
                else
                  const SizedBox(
                    width: 160,
                    height: 40,
                  ),
              ],
            ),
          ],
        ),
      );
    }
  }

  List<Widget> instrumenteButtons() {
    return [
      //Drums
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                Picked_button_Instruments.drums == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(147, 90, 161, 1),
                      )
                    : MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonInstrument = Picked_button_Instruments.drums;
            });
          },
          child: const Text(
            "Drums",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //Horn
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                Picked_button_Instruments.horn == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(147, 90, 161, 1),
                      )
                    : MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonInstrument = Picked_button_Instruments.horn;
            });
          },
          child: const Text(
            "Horn",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //Posaune
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                Picked_button_Instruments.posaune == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(147, 90, 161, 1),
                      )
                    : MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonInstrument = Picked_button_Instruments.posaune;
            });
          },
          child: const Text(
            "Posaune",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //Sousaphon
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                Picked_button_Instruments.sousaphon == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(147, 90, 161, 1),
                      )
                    : MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonInstrument = Picked_button_Instruments.sousaphon;
            });
          },
          child: const Text(
            "Sousaphon",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //Trompete
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                Picked_button_Instruments.trompete == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(147, 90, 161, 1),
                      )
                    : MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonInstrument = Picked_button_Instruments.trompete;
            });
          },
          child: const Text(
            "Trompete",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      dropDownButton(),
    ];
  }

  List<Widget> kommissionenButtons() {
    return [
      //Vorstand
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                Picked_button_Kommissionen.vorstand == pickedButtonKommission
                    ? MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(147, 90, 161, 1),
                      )
                    : MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonKommission = Picked_button_Kommissionen.vorstand;
            });
          },
          child: const Text(
            "Vorstand",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //Expedition
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                Picked_button_Kommissionen.expedition == pickedButtonKommission
                    ? MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(147, 90, 161, 1),
                      )
                    : MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonKommission = Picked_button_Kommissionen.expedition;
            });
          },
          child: const Text(
            "Expedition",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //Sujetkommission
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: Picked_button_Kommissionen.sujetkomission ==
                    pickedButtonKommission
                ? MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(147, 90, 161, 1),
                  )
                : MaterialStateProperty.all<Color>(
                    Colors.grey,
                  ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonKommission =
                  Picked_button_Kommissionen.sujetkomission;
            });
          },
          child: const Text(
            "Sujetkommission",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //MuKo
      SizedBox(
        width: 160,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: Picked_button_Kommissionen.musikkomission ==
                    pickedButtonKommission
                ? MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(147, 90, 161, 1),
                  )
                : MaterialStateProperty.all<Color>(
                    Colors.grey,
                  ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              pickedButtonKommission =
                  Picked_button_Kommissionen.musikkomission;
            });
          },
          child: const Text(
            "Musikkommission",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      dropDownButton(),
    ];
  }

  Widget dropDownButton() {
    return PopupMenuButton(
      onSelected: (result) {
        if (result == 0) {
          setState(() {
            buttonType = ButtonType.Instrumente;
          });
        } else if (result == 1) {
          setState(() {
            buttonType = ButtonType.Kommissionen;
          });
        }
      },
      itemBuilder: (context) {
        return List.generate(
          2,
          (index) {
            return PopupMenuItem(
              value: index,
              child: Row(
                children: [
                  if (index == 0)
                    const Text("Instrumente")
                  else
                    const Text("Ämtli"),
                ],
              ),
            );
          },
        );
      },
      child: SizedBox(
        width: 160,
        height: 40,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          alignment: Alignment.center,
          child: DropdownButton(
            value: buttonType == ButtonType.Instrumente ? 0 : 1,
            items: const [
              DropdownMenuItem(
                value: 0,
                child: Text(
                  "Instrumente",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text(
                  "Ämtli",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
