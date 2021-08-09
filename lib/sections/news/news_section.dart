import 'package:flutter/material.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/sections/news/components/news_card.dart';

class NewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            title: "News",
            subTitle: "Aktuelles auf einen Blick!",
            color: Color(0xFF00B1FF),
          ),
          const SizedBox(height: kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => NewsCard(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
