import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/members_model.dart';
import 'package:website_frontend/provider/member_provider.dart';

class MemberSection extends StatefulWidget {
  @override
  _MemberSectionState createState() => _MemberSectionState();
}

enum ButtonType {
  instrumente,
  kommissionen,
}

enum PickedButtonInstruments {
  trompete,
  posaune,
  horn,
  sousaphon,
  drums,
}

enum PickedButtonKommissionen {
  vorstand,
  expedition,
  sujetkomission,
  musikkomission,
  wagenbau,
}

class _MemberSectionState extends State<MemberSection> {
  ButtonType buttonType = ButtonType.instrumente;

  @override
  void initState() {
    super.initState();
    Provider.of<MemberProvider>(context, listen: false).createMembers();
  }

  Widget createMemberCard(Member member) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => context.push(
          '/mitglied/${member.firstName.toLowerCase()}/${member.lastName.toLowerCase()}',
          extra: member.pictureUrlMax,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: _buildMember(member),
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
      ),
    );
  }

  Widget createMemberCardPremium(
    Member member,
    PickedButtonKommissionen buttonType,
  ) {
    String aemtli = "";
    if (buttonType == PickedButtonKommissionen.vorstand) {
      aemtli = member.vorstand;
    } else if (buttonType == PickedButtonKommissionen.expedition) {
      aemtli = member.expedition;
    } else if (buttonType == PickedButtonKommissionen.sujetkomission) {
      aemtli = member.sujetKommission;
    } else if (buttonType == PickedButtonKommissionen.musikkomission) {
      aemtli = member.muKo;
    }
    return Container(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => GoRouter.of(context).push(
          '/mitglied/${member.firstName.toLowerCase()}/${member.lastName.toLowerCase()}',
          extra: member.pictureUrlMax,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: _buildMember(member),
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
      ),
    );
  }

  Widget _buildMember(Member member) {
    if (member.pictureUrl.contains("https://")) {
      return Image.network(
        member.pictureUrl,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        member.pictureUrl,
        fit: BoxFit.cover,
      );
    }
  }

  PickedButtonInstruments pickedButtonInstrument =
      PickedButtonInstruments.drums;
  PickedButtonKommissionen pickedButtonKommission =
      PickedButtonKommissionen.vorstand;

  @override
  Widget build(BuildContext context) {
    final myMemberProvider = context.watch<MemberProvider>();
    final double width = MediaQuery.of(context).size.width;

    List<Widget> getMemberList() {
      if (buttonType == ButtonType.instrumente) {
        if (pickedButtonInstrument == PickedButtonInstruments.drums) {
          return List.generate(
            myMemberProvider.getMemberOfInstrument("Drums").length,
            (index) => createMemberCard(
              myMemberProvider.getMemberOfInstrument("Drums")[index],
            ),
          );
        } else if (pickedButtonInstrument == PickedButtonInstruments.horn) {
          return List.generate(
            myMemberProvider.getMemberOfInstrument("Horn").length,
            (index) => createMemberCard(
              myMemberProvider.getMemberOfInstrument("Horn")[index],
            ),
          );
        } else if (pickedButtonInstrument ==
            PickedButtonInstruments.sousaphon) {
          return List.generate(
            myMemberProvider.getMemberOfInstrument("Sousaphon").length,
            (index) => createMemberCard(
              myMemberProvider.getMemberOfInstrument("Sousaphon")[index],
            ),
          );
        } else if (pickedButtonInstrument == PickedButtonInstruments.trompete) {
          return List.generate(
            myMemberProvider.getMemberOfInstrument("Trompete").length,
            (index) => createMemberCard(
              myMemberProvider.getMemberOfInstrument("Trompete")[index],
            ),
          );
        } else if (pickedButtonInstrument == PickedButtonInstruments.posaune) {
          return List.generate(
            myMemberProvider.getMemberOfInstrument("Posaune").length,
            (index) => createMemberCard(
              myMemberProvider.getMemberOfInstrument("Posaune")[index],
            ),
          );
        } else {
          return [];
        }
      } else {
        //ButtonType == Kommissionen
        if (pickedButtonKommission == PickedButtonKommissionen.vorstand) {
          return List.generate(
            myMemberProvider.getMemberOfVorstand().length,
            (index) => createMemberCardPremium(
              myMemberProvider.getMemberOfVorstand()[index],
              PickedButtonKommissionen.vorstand,
            ),
          );
        } else if (pickedButtonKommission ==
            PickedButtonKommissionen.expedition) {
          return List.generate(
            myMemberProvider.getMemberOfExpedition().length,
            (index) => createMemberCardPremium(
              myMemberProvider.getMemberOfExpedition()[index],
              PickedButtonKommissionen.expedition,
            ),
          );
        } else if (pickedButtonKommission ==
            PickedButtonKommissionen.sujetkomission) {
          return List.generate(
            myMemberProvider.getMemberOfSujetkommission().length,
            (index) => createMemberCardPremium(
              myMemberProvider.getMemberOfSujetkommission()[index],
              PickedButtonKommissionen.sujetkomission,
            ),
          );
        } else if (pickedButtonKommission ==
            PickedButtonKommissionen.musikkomission) {
          return List.generate(
            myMemberProvider.getMemberOfMuKo().length,
            (index) => createMemberCardPremium(
              myMemberProvider.getMemberOfMuKo()[index],
              PickedButtonKommissionen.musikkomission,
            ),
          );
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
      //  color: const Color.fromRGBO(230, 230, 230, 1),
      child: Align(
        child: Container(
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
                  title: "Mitglieder",
                  subTitle: "SiEh dir diEsE BEautiEs an!",
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Here comes the buttons
              memberButtonsResponsive(),
              const SizedBox(
                height: 30,
              ),
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
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget memberButtonsResponsive() {
    final double width = MediaQuery.of(context).size.width;
    if (width > 1000) {
      return Container(
        height: 60,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: buttonType == ButtonType.instrumente
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
                if (buttonType == ButtonType.instrumente)
                  instrumenteButtons()[0]
                else
                  kommissionenButtons()[0],
                if (buttonType == ButtonType.instrumente)
                  instrumenteButtons()[1]
                else
                  kommissionenButtons()[1],
                if (buttonType == ButtonType.instrumente)
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
                if (buttonType == ButtonType.instrumente)
                  instrumenteButtons()[3]
                else
                  kommissionenButtons()[3],
                if (buttonType == ButtonType.instrumente)
                  instrumenteButtons()[4]
                else
                  kommissionenButtons()[4],
                if (buttonType == ButtonType.instrumente)
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
                if (buttonType == ButtonType.instrumente)
                  instrumenteButtons()[0]
                else
                  kommissionenButtons()[0],
                if (buttonType == ButtonType.instrumente)
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
                if (buttonType == ButtonType.instrumente)
                  instrumenteButtons()[2]
                else
                  kommissionenButtons()[2],
                if (buttonType == ButtonType.instrumente)
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
                if (buttonType == ButtonType.instrumente)
                  instrumenteButtons()[4]
                else
                  kommissionenButtons()[4],
                if (buttonType == ButtonType.instrumente)
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
                PickedButtonInstruments.drums == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
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
              pickedButtonInstrument = PickedButtonInstruments.drums;
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
                PickedButtonInstruments.horn == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
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
              pickedButtonInstrument = PickedButtonInstruments.horn;
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
                PickedButtonInstruments.posaune == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
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
              pickedButtonInstrument = PickedButtonInstruments.posaune;
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
                PickedButtonInstruments.sousaphon == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
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
              pickedButtonInstrument = PickedButtonInstruments.sousaphon;
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
                PickedButtonInstruments.trompete == pickedButtonInstrument
                    ? MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
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
              pickedButtonInstrument = PickedButtonInstruments.trompete;
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
                PickedButtonKommissionen.vorstand == pickedButtonKommission
                    ? MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
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
              pickedButtonKommission = PickedButtonKommissionen.vorstand;
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
                PickedButtonKommissionen.expedition == pickedButtonKommission
                    ? MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
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
              pickedButtonKommission = PickedButtonKommissionen.expedition;
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
            backgroundColor: PickedButtonKommissionen.sujetkomission ==
                    pickedButtonKommission
                ? MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor,
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
              pickedButtonKommission = PickedButtonKommissionen.sujetkomission;
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
            backgroundColor: PickedButtonKommissionen.musikkomission ==
                    pickedButtonKommission
                ? MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor,
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
              pickedButtonKommission = PickedButtonKommissionen.musikkomission;
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
            buttonType = ButtonType.instrumente;
          });
        } else if (result == 1) {
          setState(() {
            buttonType = ButtonType.kommissionen;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: (buttonType == ButtonType.instrumente)
                    ? const Text(
                        "Instrumente",
                        style: TextStyle(color: Colors.white),
                      )
                    : const Text(
                        "Ämtli",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
              const Icon(
                Icons.expand_more,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
