import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorCategory.dart';
import 'Constants.dart';
import 'PrefData.dart';
import 'SizeConfig.dart';
import 'generated/l10n.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  bool isFirst = true;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    _getIsFirst();
    Timer(Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => MyHomeApp()));
      // }
    });
  }

  _getIsFirst() async {
    isFirst = await PrefData().getIsFirstIntro();
  }

  ThemeData themeData = new ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColor,
      accentColor: accentColor);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.assetsImagePath + "splash_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: FadeTransition(
          opacity: animation,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: SizeConfig.safeBlockVertical * 52,
                ),
                Column(
                  children: [
                    Image.asset(
                      Constants.assetsImagePath + "home_icons.png",
                      height: SizeConfig.safeBlockHorizontal * 35,
                      width: SizeConfig.safeBlockHorizontal * 35,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      S.of(context).shapeYourBody,
                      // "Shape Your Body",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w800,
                          fontFamily: Constants.fontsFamily),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      S.of(context).buildMuscleGetTonedAchiveAnAthletsBody,
                      // "build muscle, get toned, achieve an athlete's body",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          fontFamily: Constants.fontsFamily),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
