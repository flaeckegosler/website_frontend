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
    final List<Birthday> upcomingBirthdays = [];

    for (final birthday in memberBirthday) {
      if ((birthday.birthday.month > today.month) ||
          (birthday.birthday.month == today.month &&
              birthday.birthday.day >= today.day)) {
        upcomingBirthdays.add(birthday);
      }
    }
    upcomingBirthdays.sort((a, b) => a.birthday.compareTo(b.birthday));

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
