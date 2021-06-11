import 'package:flutter/material.dart';

class Config {
  static const MaterialColor myColor = MaterialColor(
    _myColorValue,
    <int, Color>{
      50: Color(_myColorValue),
      100: Color(_myColorValue),
      200: Color(_myColorValue),
      300: Color(_myColorValue),
      350: Color(
          _myColorValue), // only for raised button while pressed in light theme
      400: Color(_myColorValue),
      500: Color(_myColorValue),
      600: Color(_myColorValue),
      700: Color(_myColorValue),
      800: Color(_myColorValue),
      850: Color(_myColorValue), // only for background color in dark theme
      900: Color(_myColorValue),
    },
  );
  static const int _myColorValue = 0xFFe00a0a;

  final String appName = 'Cathelete';
  final splashIcon = 'assets/splash_screen.png';
  final String supportEmail = 'contact@cathelete.com';
  final String privacyPolicyUrl = 'https://cathelete.com/privacy/';
  final String ourWebsiteUrl = 'https://cathelete.com';
  final String termsUrl = 'https://cathelete.com/terms/';
  final String aboutUrl = 'https://cathelete.com/about/';
  final String newsUrl = 'https://cathelete.com/';
  final String iOSAppId = '0000000000';
  final String current_protocol_domain = 'https://manage.cathelete.com';
  final String epass = '4wNt&=(wE82cPEexa]s@F}j2=.dJxG-F';

  final String doneAsset = 'assets/done.json';
  final Color appColor = myColor; //you can change your whole app color

  //Intro images
  final String introImage1 = 'assets/news7.png';
  final String introImage2 = 'assets/news6.png';
  final String introImage3 = 'assets/news1.png';

  //Language Setup

  final List<String> languages = ['English'];
}
