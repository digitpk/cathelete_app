import 'package:flutter/material.dart';
import 'package:cathelete/config/config.dart';

class ThemeModel {
  static const MaterialColor myColor = MaterialColor(
    0xFF003399,
    <int, Color>{
      50: Color(0xFF003399),
      100: Color(0xFF003399),
      200: Color(0xFF003399),
      300: Color(0xFF003399),
      350: Color(
          0xFF003399), // only for raised button while pressed in light theme
      400: Color(0xFF003399),
      500: Color(0xFF003399),
      600: Color(0xFF003399),
      700: Color(0xFF003399),
      800: Color(0xFF003399),
      850: Color(0xFF003399), // only for background color in dark theme
      900: Color(0xFF003399),
    },
  );

  static const MaterialColor blackColor = MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      350: Color(
          0xFF000000), // only for raised button while pressed in light theme
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      850: Color(0xFF000000), // only for background color in dark theme
      900: Color(0xFF000000),
    },
  );

  final lightMode = ThemeData(
    primarySwatch: Config().appColor,
    primaryColor: Config().appColor,
    accentColor: Config().appColor,
    iconTheme: IconThemeData(color: Colors.grey[900]),
    fontFamily: 'Manrope',
    scaffoldBackgroundColor: Colors.grey[100],
    brightness: Brightness.light,
    primaryColorDark: Colors.grey[800],
    primaryColorLight: Colors.white,
    secondaryHeaderColor: Colors.grey[600],
    shadowColor: Colors.grey[200],
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.grey[900],
      ),
      actionsIconTheme: IconThemeData(color: Colors.grey[900]),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.grey[900],
        ),
      ),
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey[900]),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Config().appColor,
      unselectedItemColor: Colors.grey[500],
    ),
  );

  final darkMode = ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: Config().appColor,
      accentColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      fontFamily: 'Manrope',
      scaffoldBackgroundColor: Color(0xff303030),
      brightness: Brightness.dark,
      primaryColorDark: Colors.grey[300],
      primaryColorLight: Colors.grey[800],
      secondaryHeaderColor: Colors.grey[400],
      shadowColor: Color(0xff282828),
      backgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Colors.grey[900],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      textTheme: TextTheme(
        subtitle1: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
      ));
}
