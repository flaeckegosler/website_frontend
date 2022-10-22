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
    // if (index == 0)  AppBar /TopSection()
    // index == 1 SizedBox(height: kDefaultPadding * 2);
    // index == 2 NewsSection();
    // index == 3 GallerySection();
    // index == 4  MemberSection();
    // index == 5  BottomBar();
    if (section == "News") {
      index = 1;
    } else if (section == "Fotos") {
      index = 2;
    } else if (section == "Agenda") {
      index = 3;
    } else if (section == "Mitglieder") {
      index = 4;
    } else if (section == "Sound") {
      index = 5;
    }
    navBarScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
    );
  }
}
