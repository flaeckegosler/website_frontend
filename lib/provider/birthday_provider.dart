import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:website_frontend/models/birthday.dart';

class BirthdayProvider with ChangeNotifier {
  final List<Birthday> memberBirthday = [];

  List<Birthday> get allmemberBirthday {
    memberBirthday.sort((a, b) => a.birthday.compareTo(b.birthday));
    return List.from(memberBirthday);
  }

  List<Birthday> get nextThreeBirthdays {
    final today = DateTime.now();
    // Sort all birthdays by month and day
    final sortedBirthdays = memberBirthday
      ..sort((a, b) {
        final int monthCompare = a.birthday.month.compareTo(b.birthday.month);
        if (monthCompare == 0) {
          return a.birthday.day.compareTo(b.birthday.day);
        }
        return monthCompare;
      });

    // Split the list into two based on today's date
    final List<Birthday> beforeToday = [];
    final List<Birthday> afterOrOnToday = [];
    for (final birthday in sortedBirthdays) {
      //print("${birthday.birthday.month}/${birthday.birthday.day}");
      if ((birthday.birthday.month < today.month) ||
          (birthday.birthday.month == today.month &&
              birthday.birthday.day < today.day)) {
        beforeToday.add(birthday);
      } else {
        afterOrOnToday.add(birthday);
      }
    }

    // Concatenate the lists with afterToday first
    final List<Birthday> upcomingBirthdays = afterOrOnToday + beforeToday;

    // Take the first three birthdays
    return upcomingBirthdays.take(3).toList();
  }

  List<Birthday> birthdayFromJson(String str) => List<Birthday>.from(
        json
                .decode(str)
                .map((x) => Birthday.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>,
      );

  Future<void> readBirthdayJson() async {
    final String response =
        await rootBundle.loadString('assets/jsons/birthday.json');
    if (memberBirthday.isEmpty) {
      memberBirthday.addAll(birthdayFromJson(response));
    }
  }
}
