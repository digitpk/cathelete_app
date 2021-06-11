import 'package:cathelete/constant/constants.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  bool favorite = false, play = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/jump-girl.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Set 1 / 3'.toUpperCase(),
                  style: darkBlue12RegularTextStyle,
                ),
                heightSpace,
                Text(
                  'Laterale Jump',
                  style: darkBlue18SemiBoldTextStyle,
                ),
                heightSpace,
                heightSpace,
                Text(
                  '00:34',
                  style: darkBlue26BoldTextStyle,
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            favorite = !favorite;
                          });
                        },
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: darkBlueColor.withOpacity(0.2),
                          ),
                          child: Icon(
                            (favorite) ? Icons.favorite : Icons.favorite_border,
                            color: darkBlueColor,
                            size: 26.0,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            play = !play;
                          });
                        },
                        borderRadius: BorderRadius.circular(45.0),
                        child: Container(
                          width: 90.0,
                          height: 90.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.0),
                            color: darkBlueColor,
                          ),
                          child: Icon(
                            (play) ? Icons.pause : Icons.play_arrow,
                            color: whiteColor,
                            size: 45.0,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: darkBlueColor.withOpacity(0.2),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: darkBlueColor,
                            size: 26.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
