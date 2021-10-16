import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/members_model.dart';
import 'package:website_frontend/provider/member_provider.dart';

class MemberSection extends StatefulWidget {
  @override
  _MemberSectionState createState() => _MemberSectionState();
}

class _MemberSectionState extends State<MemberSection> {
  @override
  void initState() {
    super.initState();
    Provider.of<MemberProvider>(context, listen: false).createMembers();
  }

  Widget createMemberCard(Member member) {
    return Card(
      child: Image.network(member.pictureUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _myMemberProvider = context.watch<MemberProvider>();

    var myList = List.generate(_myMemberProvider.allMembers.length,
        (index) => createMemberCard(_myMemberProvider.allMembers[index]));

    return SizedBox(
      width: double.infinity,
      //color: const Color.fromRGBO(141, 66, 245, 1),
      child: Align(
        child: Container(
          alignment: Alignment.center,
          //color: Colors.red, //good for debugging
          constraints: const BoxConstraints(maxWidth: 1250),
          height: 1000,
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
              Expanded(
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  children: myList,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.purple,
                      child: Column(
                        children: [
                          Text(_myMemberProvider.allMembers[0].lastName),
                          Text(_myMemberProvider.allMembers[1].lastName),
                          Text(_myMemberProvider.allMembers[2].lastName),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
