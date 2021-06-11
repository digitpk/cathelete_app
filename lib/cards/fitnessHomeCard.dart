import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cathelete/utils/next_screen.dart';
import 'package:cathelete/config/config.dart';
import 'package:cathelete/constant/constants.dart';
import 'package:cathelete/widgets/column_builder.dart';
import 'package:cathelete/pages/fitness/workout_detail.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class FitnessHomeCard extends StatefulWidget {
  dynamic data;
  String heroTag;
  FitnessHomeCard({Key key, @required this.data, @required this.heroTag})
      : super(key: key);

  @override
  _FitnessHomeCardState createState() => _FitnessHomeCardState();
}

class _FitnessHomeCardState extends State<FitnessHomeCard> {
  dynamic data;
  String heroTag;
  _FitnessHomeCardState({Key key, @required this.data, @required this.heroTag});

  final exerciseList = [
    {
      'title': 'Push-ups',
      'image': 'assets/workout/workout_1.jpg',
      'time': '2 mins',
      'burn': '85 Calories',
      'status': 'completed'
    },
    {
      'title': 'Medicine Ball Slam',
      'image': 'assets/workout/workout_6.jpg',
      'time': '3 mins',
      'burn': '70 Calories',
      'status': 'completed'
    },
    {
      'title': 'The Plank',
      'image': 'assets/workout/workout_5.jpg',
      'time': '3 mins',
      'burn': '60 Calories',
      'status': 'remain'
    },
  ];

  bool today_schedule = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 10,
                    offset: Offset(0, 3))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Hero(
                      tag: 'string2334q35243t34wt',
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 1,
                                    offset: Offset(1, 1))
                              ],
                            ),
                            child: Image.asset(
                              'assets/fitness.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'My Fitness Plan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Today - 330 cal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Tomorrow - 410 cal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.time,
                        color: Colors.grey,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Today's schedule",
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: InkWell(
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      onTap: () {
                        bool new_today_schedule;
                        if (today_schedule == true) {
                          new_today_schedule = false;
                        } else {
                          new_today_schedule = true;
                        }

                        setState(() {
                          today_schedule = new_today_schedule;
                        });
                      },
                    ),
                  )
                ],
              ),
              Visibility(
                visible: today_schedule,
                child: exercise(),
              ),
            ],
          )),
      onTap: () {
        nextScreen(
            context,
            WorkoutDetail(
              title: 'Full body challenge',
              image: 'assets/slider/slider_1.jpg',
              heroTag: 'slider_1',
            ));
      },
    );
  }

  exercise() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList.length,
        itemBuilder: (context, index) {
          final item = exerciseList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80.0,
                    margin: EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
                    padding: EdgeInsets.only(
                      left: (45.0 + fixPadding),
                      right: fixPadding,
                    ),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 3.0,
                          spreadRadius: 3.0,
                          color: lightGreyColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: black16MediumTextStyle,
                            ),
                            height5Space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Time:',
                                  style: black12MediumTextStyle,
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  item['time'],
                                  style: grey12RegularTextStyle,
                                )
                              ],
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Burns:',
                                  style: black12MediumTextStyle,
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  item['burn'],
                                  style: grey12RegularTextStyle,
                                )
                              ],
                            ),
                          ],
                        ),
                        (item['status'] == 'completed')
                            ? Container(
                                width: 24.0,
                                height: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 16.0,
                                  color: whiteColor,
                                ),
                              )
                            : Container(
                                height: 80.0,
                                margin: EdgeInsets.only(top: fixPadding),
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Config().appColor,
                                  ),
                                  child: Text(
                                    'Remain',
                                    style: whiteSmallTextStyle,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Container(
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 2.0,
                        color: (index % 2 == 0)
                            ? Config().appColor
                            : Colors.red[800],
                      ),
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              (index != exerciseList.length - 1)
                  ? Container(
                      width: 1.5,
                      height: 30.0,
                      color: (item['status'] == 'completed')
                          ? Config().appColor
                          : greyColor.withOpacity(0.7),
                      margin: EdgeInsets.only(left: 43.5),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
