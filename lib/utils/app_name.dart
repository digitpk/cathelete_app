import 'package:flutter/material.dart';
import 'package:cathelete/config/config.dart';

class AppName extends StatelessWidget {
  final double fontSize;
  const AppName({Key key, @required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Witty', //first part
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800]),
        children: <TextSpan>[
          TextSpan(
              text: 'Fy', //second part
              style:
                  TextStyle(fontFamily: 'Poppins', color: Config().appColor)),
        ],
      ),
    );
  }
}
