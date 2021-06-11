import 'package:cathelete/constant/constants.dart';
import 'package:cathelete/pages/fitness/screens.dart';
import 'package:cathelete/pages/fitness/workout_explore.dart';
import 'package:cathelete/widgets/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cathelete/utils/next_screen.dart';
import 'package:cathelete/config/config.dart';

class WorkoutDetail extends StatefulWidget {
  final String title, heroTag, image;

  const WorkoutDetail(
      {Key key,
      @required this.title,
      @required this.heroTag,
      @required this.image})
      : super(key: key);
  @override
  _WorkoutDetailState createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool favorite = false;

  final exerciseWorkoutExplore = {
    'title': 'Push-ups',
    'thumbnail': 'assets/workout/workout_1.jpg',
    'burn': '85 Calories',
    'set': '3',
    'reps': '5',
    'rest': '20 Sec',
    'video': 'https://www.youtube.com/watch?v=IODxDxX7oi4',
    'status': 'completed'
  };

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

  final exerciseList1 = [
    {
      'title': 'Mountain Climbers',
      'image': 'assets/workout/workout_3.jpg',
      'time': '3 mins',
      'burn': '75 Calories',
      'status': 'completed'
    },
    {
      'title': 'The Plank',
      'image': 'assets/workout/workout_5.jpg',
      'time': '3 mins',
      'burn': '60 Calories',
      'status': 'completed'
    }
  ];

  final exerciseList2 = [
    {
      'title': 'Mountain Climbers',
      'image': 'assets/workout/workout_3.jpg',
      'time': '3 mins',
      'burn': '75 Calories',
      'status': 'completed'
    },
    {
      'title': 'Medicine Ball Slam',
      'image': 'assets/workout/workout_6.jpg',
      'time': '3 mins',
      'burn': '70 Calories',
      'status': 'remain'
    }
  ];

  final exerciseList3 = [
    {
      'title': 'Boat Pose',
      'image': 'assets/workout/workout_4.jpg',
      'time': '2 mins',
      'burn': '40 Calories',
      'status': 'completed'
    },
    {
      'title': 'The Plank',
      'image': 'assets/workout/workout_5.jpg',
      'time': '3 mins',
      'burn': '60 Calories',
      'status': 'completed'
    },
  ];

  final exerciseList4 = [
    {
      'title': 'Push-ups',
      'image': 'assets/workout/workout_1.jpg',
      'time': '2 mins',
      'burn': '85 Calories',
      'status': 'completed'
    },
    {
      'title': 'Bicycle Crunch',
      'image': 'assets/workout/workout_2.jpg',
      'time': '2 mins',
      'burn': '95 Calories',
      'status': 'completed'
    },
  ];

  final exerciseList5 = [
    {
      'title': 'Mountain Climbers',
      'image': 'assets/workout/workout_3.jpg',
      'time': '3 mins',
      'burn': '75 Calories',
      'status': 'completed'
    },
    {
      'title': 'Boat Pose',
      'image': 'assets/workout/workout_4.jpg',
      'time': '2 mins',
      'burn': '40 Calories',
      'status': 'completed'
    },
  ];

  final exerciseList6 = [
    {
      'title': 'The Plank',
      'image': 'assets/workout/workout_5.jpg',
      'time': '3 mins',
      'burn': '60 Calories',
      'status': 'completed'
    },
    {
      'title': 'Medicine Ball Slam',
      'image': 'assets/workout/workout_6.jpg',
      'time': '3 mins',
      'burn': '70 Calories',
      'status': 'remain'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My Fitness Plan'),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  aboutExercise(),
                  Container(
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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          color: Colors.white,
                          child: Text(
                            'Today schedule',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        todayExercise(),
                      ],
                    ),
                  ),
                  Container(
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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          color: Colors.white,
                          child: Text(
                            'Monday schedule',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        exercise1(),
                      ],
                    ),
                  ),
                  Container(
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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          color: Colors.white,
                          child: Text(
                            'Tuesday schedule',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        exercise2(),
                      ],
                    ),
                  ),
                  Container(
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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          color: Colors.white,
                          child: Text(
                            'Wednesday schedule',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        exercise3(),
                      ],
                    ),
                  ),
                  Container(
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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          color: Colors.white,
                          child: Text(
                            'Thursday schedule',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        exercise4(),
                      ],
                    ),
                  ),
                  Container(
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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          color: Colors.white,
                          child: Text(
                            'Friday schedule',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        exercise5(),
                      ],
                    ),
                  ),
                  Container(
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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          color: Colors.white,
                          child: Text(
                            'Saturday schedule',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        exercise6(),
                      ],
                    ),
                  ),
                  Container(
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
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          color: Colors.white,
                          child: Text(
                            'Sunday schedule',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 2,
                        ),
                        exercise7(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  aboutExercise() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(fixPadding * 2.0),
      color: Config().appColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: (width - fixPadding * 4.0 - 2.0) / 2.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: 3 Exercises',
                  style: white14MediumTextStyle,
                ),
                heightSpace,
                Text(
                  'Time: 8 Min',
                  style: white14MediumTextStyle,
                ),
              ],
            ),
          ),
          Container(
            width: 1.0,
            height: 60.0,
            color: whiteColor,
          ),
          Container(
            width: (width - fixPadding * 4.0 - 2.0) / 2.0,
            padding: EdgeInsets.only(left: fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Energy you\'ll burn',
                  style: white14MediumTextStyle,
                ),
                heightSpace,
                Text(
                  '330 Calories',
                  style: white14MediumTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  todayExercise() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList.length,
        itemBuilder: (context, index) {
          final item = exerciseList[index];
          return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        margin:
                            EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
              ),
              onTap: () {
                nextScreen(
                    context,
                    WorkOutExplore(
                        heroTag: 'sdsfsfdf', data: exerciseWorkoutExplore));
              });
        },
      ),
    );
  }

  exercise1() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList1.length,
        itemBuilder: (context, index) {
          final item = exerciseList1[index];
          return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        margin:
                            EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
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
                            Container(
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
                  (index != exerciseList1.length - 1)
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
              ),
              onTap: () {
                nextScreen(
                    context,
                    WorkOutExplore(
                        heroTag: 'sdsfsfdf', data: exerciseWorkoutExplore));
              });
        },
      ),
    );
  }

  exercise2() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList2.length,
        itemBuilder: (context, index) {
          final item = exerciseList2[index];
          return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        margin:
                            EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
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
                            Container(
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
                  (index != exerciseList2.length - 1)
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
              ),
              onTap: () {
                nextScreen(
                    context,
                    WorkOutExplore(
                        heroTag: 'sdsfsfdf', data: exerciseWorkoutExplore));
              });
        },
      ),
    );
  }

  exercise3() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList3.length,
        itemBuilder: (context, index) {
          final item = exerciseList3[index];
          return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        margin:
                            EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
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
                            Container(
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
                  (index != exerciseList3.length - 1)
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
              ),
              onTap: () {
                nextScreen(
                    context,
                    WorkOutExplore(
                        heroTag: 'sdsfsfdf', data: exerciseWorkoutExplore));
              });
        },
      ),
    );
  }

  exercise4() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList4.length,
        itemBuilder: (context, index) {
          final item = exerciseList4[index];
          return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        margin:
                            EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
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
                            Container(
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
                  (index != exerciseList4.length - 1)
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
              ),
              onTap: () {
                nextScreen(
                    context,
                    WorkOutExplore(
                        heroTag: 'sdsfsfdf', data: exerciseWorkoutExplore));
              });
        },
      ),
    );
  }

  exercise5() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList5.length,
        itemBuilder: (context, index) {
          final item = exerciseList5[index];
          return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        margin:
                            EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
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
                            Container(
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
                  (index != exerciseList5.length - 1)
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
              ),
              onTap: () {
                nextScreen(
                    context,
                    WorkOutExplore(
                        heroTag: 'sdsfsfdf', data: exerciseWorkoutExplore));
              });
        },
      ),
    );
  }

  exercise6() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList6.length,
        itemBuilder: (context, index) {
          final item = exerciseList6[index];
          return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        margin:
                            EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
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
                            Container(
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
                  (index != exerciseList6.length - 1)
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
              ),
              onTap: () {
                nextScreen(
                    context,
                    WorkOutExplore(
                        heroTag: 'sdsfsfdf', data: exerciseWorkoutExplore));
              });
        },
      ),
    );
  }

  exercise7() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList.length,
        itemBuilder: (context, index) {
          final item = exerciseList[index];
          return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        margin:
                            EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
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
                            Container(
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
              ),
              onTap: () {
                nextScreen(
                    context,
                    WorkOutExplore(
                        heroTag: 'sdsfsfdf', data: exerciseWorkoutExplore));
              });
        },
      ),
    );
  }
}
