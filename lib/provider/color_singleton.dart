import 'dart:ui';

class ColorSingleton {
  static final ColorSingleton _singleton = ColorSingleton._internal();

  factory ColorSingleton() {
    return _singleton;
  }

  ColorSingleton._internal();

  Color placeHolderColor = const Color.fromRGBO(147, 90, 162, 1);

  Color loadingIndicatorColor = const Color.fromRGBO(147, 90, 162, 1);

  Color mainTheme = const Color.fromRGBO(147, 90, 162, 1);
}
