import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    required this.subTitle,
    required this.color,
    this.fontFamily = "Shakuro",
    this.fontSizeMainTitle = 48,
    this.fontWeight = FontWeight.bold,
  });

  final String title;
  final String subTitle;
  final Color color;
  final String fontFamily;
  final double fontSizeMainTitle;
  final FontWeight fontWeight;

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
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: kTextColor,
                    fontFamily: fontFamily,
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
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: fontWeight,
                        color: Colors.black,
                        fontFamily: fontFamily,
                        fontSize: fontSizeMainTitle,
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
