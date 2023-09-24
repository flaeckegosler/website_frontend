import 'package:flutter/material.dart';
import 'package:website_frontend/models/birthday.dart';

class BirthdayCard extends StatelessWidget {
  final List<Birthday> birthdays;

  const BirthdayCard({required this.birthdays});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              title: const Text(
                "Nächste Geburtstage",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Set the border radius
              color: Colors.white,
            ),
            //color: Colors.white,
            height: 150,
            child: ListView.builder(
              itemCount: birthdays.length,
              itemBuilder: (context, index) {
                final Birthday birthday = birthdays[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${birthday.firstName} ${birthday.lastName}',
                      ),
                      Text(
                        birthday.getFormattedBirthday(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
