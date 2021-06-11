import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static String assetsImagePath = "assets/images/";
  static String assetsGifPath = "assets/gifs/";
   static  String fontsFamily = 'OpenSans';
   static  String videoURL = 'https://www.youtube.com/watch?v=ml6cT4AZdqI';
  static int levelBeginner = 1;
  static int levelIntermediate = 2;
  static int levelAdvanced = 3;

  static DateFormat addDateFormat = DateFormat("dd-MM-yyyy","en-US");
 static DateFormat historyTitleDateFormat = DateFormat("MMMM dd, yyyy","en-US");

  static Color getColorFromHex(String colors) {
    var color = "0xFF$colors";
    try {
      return Color(int.parse(color));
    } catch (e) {
      print(e);
      return Color(0xFFFFFFFF);
    }
  }

  static Color darken(Color c, [int percent = 30]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(
        c.alpha,
        (c.red * f).round(),
        (c.green  * f).round(),
        (c.blue * f).round()
    );
  }

 static Color brighten(Color c, [int percent = 15]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round()
    );
  }


}
