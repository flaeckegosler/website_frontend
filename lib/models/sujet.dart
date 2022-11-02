import 'package:flutter/material.dart';

class Sujet with ChangeNotifier {
  final String name;
  final String jahr;
  final String? vierzeiler;

  Sujet({
    required this.name,
    required this.jahr,
    this.vierzeiler,
  });
}
