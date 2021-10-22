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
      child: Image.network(
        member.pictureUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Picked_button pickedButton = Picked_button.all;

  @override
  Widget build(BuildContext context) {
    final _myMemberProvider = context.watch<MemberProvider>();

    List<Widget> getMemberList() {
      if (pickedButton == Picked_button.all) {
        return List.generate(_myMemberProvider.allMembers.length,
            (index) => createMemberCard(_myMemberProvider.allMembers[index]));
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

    return SizedBox(
      width: double.infinity,
      //color: const Color.fromRGBO(141, 66, 245, 1),
      child: Align(
        child: Container(
          alignment: Alignment.center,
          //color: Colors.red, //good for debugging
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                children: getMemberList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buttons() {
    return [
      //Show all
      ElevatedButton(
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
          "Alle!",
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
          "Trompete!",
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
          "Posaune!",
          textAlign: TextAlign.center,
        ),
      )
    ];
  }
}
