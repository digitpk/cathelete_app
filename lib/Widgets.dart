import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorCategory.dart';
import 'Constants.dart';

double smallTextSize = 17;
double extrasmallTextSize = 15;
double mediumTextSize = 21;
double largeTextSize = 40;

Widget getSmallBoldTextWithMaxLine(String text, Color color, int maxLine) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: smallTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.bold),
    maxLines: maxLine,
    textAlign: TextAlign.center,
  );
}

Widget getSmallNormalTextWithMaxLine(String text, Color color, int maxLine) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: smallTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.normal),
    maxLines: maxLine,
    textAlign: TextAlign.start,
  );
}

Widget getExtraSmallNormalTextWithMaxLine(
    String text, Color color, int maxLine, TextAlign textAlign) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: extrasmallTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.normal),
    maxLines: maxLine,
    textAlign: textAlign,
  );
}

Widget getCustomText(String text, Color color, int maxLine, TextAlign textAlign,
    FontWeight fontWeight, double textSizes) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: textSizes,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: fontWeight),
    maxLines: maxLine,
    textAlign: textAlign,
  );
}

Widget getMediumBoldTextWithMaxLine(String text, Color color, int maxLine) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: mediumTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.bold),
    maxLines: maxLine,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
  );
}

Widget getMediumTextWithWeight(
    String text, Color color, int maxLine, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: mediumTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: fontWeight),
    maxLines: maxLine,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
  );
}

Widget getSettingTabTitle(String text) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 14,
        color: blueButton,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.normal),
    maxLines: 1,
    textAlign: TextAlign.start,
    overflow: TextOverflow.ellipsis,
  );
}

Widget getSettingSingleLineText(IconData icon, String string) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    // textAlign: TextAlign.start,
    // text: TextSpan(
    children: [
      // WidgetSpan(
      //   child:
      Icon(icon, color: Colors.black, size: 25),
      // ),
      // WidgetSpan(
      //     child:
      SizedBox(
        width: 10,
        // )
      ),

      Text(string,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: Constants.fontsFamily,
              fontSize: 17,
              fontWeight: FontWeight.normal)),
    ],
    // ),
  );
}

Widget getSettingMultiLineText(IconData icon, String string, String bottomTxt) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      Icon(icon, color: Colors.black87, size: 25),
      SizedBox(
        width: 10,
        // )
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(string,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontFamily: Constants.fontsFamily,
                  fontSize: 17,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            height: 2,
          ),
          getCustomText(bottomTxt, Colors.black54, 1, TextAlign.start,
              FontWeight.w400, 14)
        ],
      ),
    ],
  );
}

Widget getMultiLineText(String string, String bottomTxt, Function function) {
  return InkWell(
    child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(string,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontFamily: Constants.fontsFamily,
                    fontSize: 17,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 2,
            ),
            getCustomText(bottomTxt, Colors.black54, 1, TextAlign.start,
                FontWeight.normal, 14)
          ],
        )),
    onTap: () {
      function();
    },
  );
}

Widget getMediumNormalTextWithMaxLine(
    String text, Color color, int maxLine, TextAlign textAlign) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: mediumTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.w500),
    maxLines: maxLine,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
  );
}

Widget getLargeBoldTextWithMaxLine(String text, Color color, int maxLine) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: largeTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.bold),
    maxLines: maxLine,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
  );
}

Widget getTitleTexts(String txtTitle) {
  return getCustomText(
      txtTitle, Colors.black87, 1, TextAlign.start, FontWeight.w600, 20);
}

Widget getSmallBoldText(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      decoration: TextDecoration.none,
      fontSize: smallTextSize,
      color: color,
      fontFamily: Constants.fontsFamily,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  );
}

Widget getMediumBoldItalicText(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: mediumTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),
    textAlign: TextAlign.center,
  );
}

Widget getSmallNormalText(String text, Color color, TextAlign textAlign) {
  return Text(
    text,
    style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: smallTextSize,
        color: color,
        fontFamily: Constants.fontsFamily,
        fontWeight: FontWeight.normal),
    textAlign: textAlign,
  );
}

Widget getMediumBoldText(String text, Color color, TextAlign textAlign) {
  return Text(text,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: mediumTextSize,
          color: color,
          fontFamily: Constants.fontsFamily,
          fontWeight: FontWeight.bold),
      textAlign: textAlign);
}

getProgressDialog() {
  return new Container(
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
      ),
      child: new Center(child: CupertinoActivityIndicator()));
}
