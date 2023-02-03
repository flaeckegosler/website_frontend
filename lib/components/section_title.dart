import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    required this.subTitle,
    required this.color,
  });

  final String title, subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: kDefaultPadding),
            padding: const EdgeInsets.only(bottom: 52),
            width: 8,
            height: 78,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 15,
                child: Text(
                  subTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    color: kTextColor,
                    fontFamily: "Shakuro",
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 57,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Shakuro",
                        fontSize: 48,
                      ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
