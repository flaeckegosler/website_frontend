import 'package:flutter/material.dart';

class News {
  final String name, review, userPic;
  final int id;
  final Color color;

  News(
      {required this.name,
      required this.review,
      required this.userPic,
      required this.id,
      required this.color});
}

// List of demo feedbacks
List<News> news = [
  News(
    id: 1,
    name: "Reto Bättig",
    review: review,
    userPic: "assets/images/people.png",
    color: Color(0xFFFFF3DD),
  ),
  News(
    id: 2,
    name: "Raphael Koch",
    review: review,
    userPic: "assets/images/people.png",
    color: Color(0xFFD9FFFC),
  ),
  News(
    id: 3,
    name: "Nick Leber",
    review: review,
    userPic: "assets/images/people.png",
    color: Color(0xFFFFE0E0),
  ),
];

String review =
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua enim ad minim veniam.';
