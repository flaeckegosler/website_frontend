import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollSingleton {
  static final ScrollSingleton _singleton = ScrollSingleton._internal();

  factory ScrollSingleton() {
    return _singleton;
  }

  ScrollSingleton._internal();

  static ItemScrollController navBarScrollController = ItemScrollController();

  Future scrollToItem(String section) async {
    int index = 0;
    if (section == "News") {
      index = 1;
    } else if (section == "Programm") {
      index = 2;
    } else if (section == "Fotos") {
      index = 3;
    } else if (section == "Agenda") {
      index = 4;
    } else if (section == "Mitglieder") {
      index = 5;
    } else if (section == "Sound") {
      index = 6;
    } else if (section == "Expedition") {
      index = 7;
    } else if (section == "Oktoberfest") {
      index = 8;
    }
    navBarScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
    );
  }
}
