import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
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

  @override
  Widget build(BuildContext context) {
    final _myMemberProvider = context.watch<MemberProvider>();
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
