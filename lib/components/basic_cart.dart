import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  final String link;
  final IconData icon;
  final String title;

  const BasicCard({
    required this.link,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), // Set the border radius
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            color: Colors.white,
          ),
          //color: Colors.white,
          height: 150,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(link);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
