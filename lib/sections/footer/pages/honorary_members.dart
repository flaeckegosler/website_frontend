import 'package:flutter/material.dart';

class HonoraryMembersPage extends StatelessWidget {
  final String paragraph = 'MEMBERS........';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
      ),
      body: Container(
        child: Text("TODO:" + paragraph),
      ),
    );
  }
}
