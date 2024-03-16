import 'package:flutter/material.dart';

abstract class Palette {
  // static const accent = Color(0xff29ACE2);
  static const accent = Color(0xffc82025);
  static const purple = Color(0xff5E2E91);
  static const yellowDark = Color(0xfffaab17);
  static const golden = Color(0xffFFD700);
  static const mediumBlack = Colors.black54;
  static const mediumHighBlack = Colors.black87;
  static const red = Color(0xffc82025);
  static const grey = Color(0xffEDEEF0);
  static const pink = Colors.pink;
  static const yellow = Colors.yellowAccent;
  static Color lightGrey = Colors.grey.shade100;
  static Color mediumGrey = Colors.grey.shade300;
  static Color darkGrey = Colors.grey.shade500;
  static const black = Color(0xff0D1B1E);
  static const white = Color(0xffFFFFFF);
  static const darkBlue = Color(0xff3b5998);
  static Color lightPurple = Colors.blueGrey.shade200;
  static const lightBlack = Colors.black45;
  static const extraLightBlack = Colors.black38;
  static const deepOrange = Colors.deepOrange;
  static const blue = Colors.blue;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Palette.accent,
    colorScheme: const ColorScheme.light(
      primary: accent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.accent,
      iconTheme: IconThemeData(color: Palette.black),
    ),
    iconTheme: const IconThemeData(color: Palette.black),
    listTileTheme: const ListTileThemeData(iconColor: Palette.black),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Palette.black, fontSize: 17),
      titleSmall: TextStyle(color: Palette.black, fontSize: 15),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Palette.white,
      unselectedItemColor: Palette.lightBlack,
      selectedItemColor: Palette.black,
    ),
    tabBarTheme:
        const TabBarTheme(labelColor: Palette.black, unselectedLabelColor: Colors.black, indicatorColor: Palette.black),
    indicatorColor: Palette.black,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Palette.accent,
    colorScheme: const ColorScheme.dark(
      primary: accent,
    ),
    switchTheme: SwitchThemeData(
      overlayColor: MaterialStatePropertyAll(Palette.darkGrey),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Palette.white),
    ),
    iconTheme: const IconThemeData(color: Palette.white),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Palette.white, fontSize: 17),
      titleSmall: TextStyle(color: Palette.white, fontSize: 15),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Palette.black.withOpacity(0.5),
      selectedItemColor: Palette.white,
      unselectedItemColor: Palette.white.withOpacity(0.5),
    ),
    listTileTheme: const ListTileThemeData(iconColor: Palette.white),
    tabBarTheme: const TabBarTheme(
      labelColor: Palette.white,
      unselectedLabelColor: Palette.white,
      indicatorColor: Palette.white,
    ),
    indicatorColor: Palette.white,
  );
}
