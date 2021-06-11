import 'package:shared_preferences/shared_preferences.dart';

class PrefData{

  static String trainingRest= "trainingRest";
  static String calorieBurn= "calorieBurn";
  static String isFirst= "isFirstIntro";


  addRestTime(int sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(trainingRest, sizes);
  }
  setIsFirst(bool sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isFirst, sizes);
  }
  addBurnCalorie(int sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(calorieBurn, sizes);
  }

  getRestTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(trainingRest) ?? 10;
    return intValue;
  }
  getIsFirstIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    bool intValue = prefs.getBool(isFirst) ?? true;
    return intValue;
  }
  getBurnCalorie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(calorieBurn) ?? 0;
    return intValue;
  }

}