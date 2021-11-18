import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/members_model.dart';
import 'package:website_frontend/provider/member_provider.dart';

class MemberSection extends StatefulWidget {
  @override
  _MemberSectionState createState() => _MemberSectionState();
}

enum Picked_button {
  all,
  trompete,
  posaune,
  horn,
  sousaphon,
  drums,
}

class _MemberSectionState extends State<MemberSection> {
  @override
  void initState() {
    super.initState();
    Provider.of<MemberProvider>(context, listen: false).createMembers();
  }

  Widget createMemberCard(Member member) {
    return Card(
      child: Stack(
        children: [
          Image.network(
            member.pictureUrl,
            fit: BoxFit.contain,
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

  Picked_button pickedButton = Picked_button.drums;

  @override
  Widget build(BuildContext context) {
    final _myMemberProvider = context.watch<MemberProvider>();
    final double width = MediaQuery.of(context).size.width;

    List<Widget> getMemberList() {
      if (pickedButton == Picked_button.all) {
        return List.generate(_myMemberProvider.allMembers.length,
            (index) => createMemberCard(_myMemberProvider.allMembers[index]));
      } else if (pickedButton == Picked_button.drums) {
        return List.generate(
            _myMemberProvider.getMemberOfInstrument("Drums").length,
            (index) => createMemberCard(
                _myMemberProvider.getMemberOfInstrument("Drums")[index]));
      } else if (pickedButton == Picked_button.horn) {
        return List.generate(
            _myMemberProvider.getMemberOfInstrument("Horn").length,
            (index) => createMemberCard(
                _myMemberProvider.getMemberOfInstrument("Horn")[index]));
      } else if (pickedButton == Picked_button.sousaphon) {
        return List.generate(
            _myMemberProvider.getMemberOfInstrument("Sousaphon").length,
            (index) => createMemberCard(
                _myMemberProvider.getMemberOfInstrument("Sousaphon")[index]));
      } else if (pickedButton == Picked_button.trompete) {
        return List.generate(
            _myMemberProvider.getMemberOfInstrument("Trompete").length,
            (index) => createMemberCard(
                _myMemberProvider.getMemberOfInstrument("Trompete")[index]));
      } else if (pickedButton == Picked_button.posaune) {
        return List.generate(
            _myMemberProvider.getMemberOfInstrument("Posaune").length,
            (index) => createMemberCard(
                _myMemberProvider.getMemberOfInstrument("Posaune")[index]));
      } else {
        return [];
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
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    maxCrossAxisExtent: 200,
                  ),
                  children: buttons(), //"Anrufbeantworter"
                ),
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
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buttons() {
    return [
      //Show all
      /* ElevatedButton(
        style: ButtonStyle(
          backgroundColor: Picked_button.all == pickedButton
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
            pickedButton = Picked_button.all;
          });
        },
        child: const Text(
          "Alle",
          textAlign: TextAlign.center,
        ),
      ),*/
      //Drums
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: Picked_button.drums == pickedButton
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
            pickedButton = Picked_button.drums;
          });
        },
        child: const Text(
          "Drums",
          textAlign: TextAlign.center,
        ),
      ),
      //Horn
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: Picked_button.horn == pickedButton
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
            pickedButton = Picked_button.horn;
          });
        },
        child: const Text(
          "Horn",
          textAlign: TextAlign.center,
        ),
      ),
      //Posaune
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: Picked_button.posaune == pickedButton
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
            pickedButton = Picked_button.posaune;
          });
        },
        child: const Text(
          "Posaune",
          textAlign: TextAlign.center,
        ),
      ),
      //Sousaphon
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: Picked_button.sousaphon == pickedButton
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
            pickedButton = Picked_button.sousaphon;
          });
        },
        child: const Text(
          "Sousaphon",
          textAlign: TextAlign.center,
        ),
      ),
      //Trompete
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: Picked_button.trompete == pickedButton
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
            pickedButton = Picked_button.trompete;
          });
        },
        child: const Text(
          "Trompete",
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}
