import 'package:flutter/material.dart';
import 'color_palette.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: ColorPalette.lightTextBackgroundColor,
    textTheme: TextTheme(
      titleSmall: TextStyle(fontFamily: 'Montserrat'),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: ColorPalette.darkBackgroundColor,
    primaryColorDark: ColorPalette.darkBackgroundColor,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: ColorPalette.darkBackgroundColor,
    textButtonTheme: TextButtonThemeData(style: ButtonStyle()),
    colorScheme: ColorScheme.dark().copyWith(
        primary: ColorPalette.darkBackgroundColor,
        secondary: ColorPalette.darkBackgroundColor),
    textTheme: TextTheme(
      titleSmall: TextStyle(fontFamily: 'Montserrat'),
    ),
  );
}

class ThemeIsDark {
  static ValueNotifier<bool> isDark = ValueNotifier<bool>(false);
}
