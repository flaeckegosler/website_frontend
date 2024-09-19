import 'package:flutter/cupertino.dart';

class AppSection {
  final String name;
  final IconData icon; // Add this line to include icons
  bool isVisible;

  AppSection({required this.name, required this.icon, this.isVisible = true});
}
