import 'package:carousel_pro/carousel_pro.dart';
import 'package:cathelete/constant/constants.dart';
import 'package:cathelete/pages/fitness/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WorkOut extends StatefulWidget {
  @override
  _WorkOutState createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  final homeWorkoutList = [
    {
      'title': '7 Minute Workout',
      'image': 'assets/quick_home_workout/quick_home_1.jpg',
      'heroTag': 'home1'
    },
    {
      'title': 'Strecho Workout',
      'image': 'assets/quick_home_workout/quick_home_2.jpg',
      'heroTag': 'home2'
    },
    {
      'title': 'Weight Gain Programs',
      'image': 'assets/quick_home_workout/quick_home_3.jpg',
      'heroTag': 'home3'
    },
    {
      'title': 'Weight Lose Program',
      'image': 'assets/quick_home_workout/quick_home_4.jpg',
      'heroTag': 'home4'
    },
    {
      'title': 'Fat Burn Workout',
      'image': 'assets/quick_home_workout/quick_home_5.jpg',
      'heroTag': 'home5'
    }
  ];

  final flatAbsWorkoutList = [
    {
      'title': 'Bicycle Crunch',
      'image': 'assets/flat_abs_workout/flat_abs_workout_1.jpg',
      'heroTag': 'flatAbs1'
    },
    {
      'title': 'Mountain Climbers',
      'image': 'assets/flat_abs_workout/flat_abs_workout_2.jpg',
      'heroTag': 'flatAbs2'
    },
    {
      'title': 'Boat Pose',
      'image': 'assets/flat_abs_workout/flat_abs_workout_3.jpg',
      'heroTag': 'flatAbs3'
    },
    {
      'title': 'The Plank',
      'image': 'assets/flat_abs_workout/flat_abs_workout_4.jpg',
      'heroTag': 'flatAbs4'
    },
    {
      'title': 'Medicine Ball Slam',
      'image': 'assets/flat_abs_workout/flat_abs_workout_5.jpg',
      'heroTag': 'flatAbs5'
    }
  ];

  final popularWorkoutList = [
    {
      'title': 'Core Reformer',
      'image': 'assets/popular_workout/popular_workout_1.jpg',
      'time': '20 min',
      'heroTag': 'popular_workout_1'
    },
    {
      'title': 'Basic Building',
      'image': 'assets/popular_workout/popular_workout_2.jpg',
      'time': '20 min',
      'heroTag': 'popular_workout_2'
    },
    {
      'title': 'Rope Jump',
      'image': 'assets/popular_workout/popular_workout_3.jpg',
      'time': '20 min',
      'heroTag': 'popular_workout_3'
    },
    {
      'title': 'Push Ups',
      'image': 'assets/popular_workout/popular_workout_4.jpg',
      'time': '20 min',
      'heroTag': 'popular_workout_4'
    },
    {
      'title': 'Laterale Jump',
      'image': 'assets/popular_workout/popular_workout_5.jpg',
      'time': '20 min',
      'heroTag': 'popular_workout_5'
    },
  ];

  final trainerList = [
    {
      'name': 'Amenda Johnson',
      'image': 'assets/trainer/trainer_1.jpg',
      'type': 'Fitness Trainer',
      'heroTag': 'trainer1'
    },
    {
      'name': 'Russeil Taylor',
      'image': 'assets/trainer/trainer_2.jpg',
      'type': 'Muscle Trainer',
      'heroTag': 'trainer2'
    },
    {
      'name': 'Lliana George',
      'image': 'assets/trainer/trainer_3.jpg',
      'type': 'Muscle Trainer',
      'heroTag': 'trainer3'
    },
    {
      'name': 'Suzein Smith',
      'image': 'assets/trainer/trainer_4.jpg',
      'type': 'Yoga Trainer',
      'heroTag': 'trainer4'
    },
    {
      'name': 'Olivier Hayden',
      'image': 'assets/trainer/trainer_5.jpg',
      'type': 'Yoga Trainer',
      'heroTag': 'trainer5'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Workout',
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          slider(),
          homeWorkoutPlan(),
          heightSpace,
          heightSpace,
          flatAbsWorkoutPlan(),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  slider() {
    return Container(
      margin: EdgeInsets.all(fixPadding * 2.0),
      height: 200.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 5.0,
            color: lightGreyColor,
          ),
        ],
      ),
      child: Carousel(
        images: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      child: WorkoutDetail(
                        title: 'Full body challenge',
                        image: 'assets/slider/slider_1.jpg',
                        heroTag: 'slider_1',
                      )));
            },
            child: sliderItem('assets/slider/slider_1.jpg',
                'Full body challenge', 'slider_1'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      child: WorkoutDetail(
                        title: 'Wait gaining workout',
                        image: 'assets/slider/slider_2.jpg',
                        heroTag: 'slider_2',
                      )));
            },
            child: sliderItem('assets/slider/slider_2.jpg',
                'Wait gaining workout', 'slider_2'),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      child: WorkoutDetail(
                        title: 'Wait loosing workout',
                        image: 'assets/slider/slider_3.jpg',
                        heroTag: 'slider_3',
                      )));
            },
            child: sliderItem('assets/slider/slider_3.jpg',
                'Wait loosing workout', 'slider_3'),
          ),
        ],
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotPosition: DotPosition.bottomRight,
        dotVerticalPadding: 5.0,
        dotHorizontalPadding: 5.0,
        dotColor: greyColor,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.transparent,
        borderRadius: false,
      ),
    );
  }

  sliderItem(image, title, heroTag) {
    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Hero(
            tag: heroTag,
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200.0,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  blackColor.withOpacity(0.0),
                  blackColor.withOpacity(0.3),
                  blackColor.withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(fixPadding),
                  child: Text(
                    title.toUpperCase(),
                    style: white16MediumTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  homeWorkoutPlan() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0, 0.0, fixPadding * 2.0, fixPadding * 2.0),
          child: Text(
            'Quick Home Workout Plan',
            style: primaryColor16MediumTextStyle,
          ),
        ),
        Container(
          width: double.infinity,
          height: 204.0,
          child: ListView.builder(
            itemCount: homeWorkoutList.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = homeWorkoutList[index];
              return Padding(
                padding: (index == 0)
                    ? EdgeInsets.only(
                        left: fixPadding * 2.0,
                        right: fixPadding * 1.5,
                        top: 2.0,
                        bottom: 2.0)
                    : (index == homeWorkoutList.length - 1)
                        ? EdgeInsets.only(
                            right: fixPadding * 2.0, top: 2.0, bottom: 2.0)
                        : EdgeInsets.only(
                            right: fixPadding * 1.5, top: 2.0, bottom: 2.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 600),
                            child: WorkoutDetail(
                              title: item['title'],
                              image: item['image'],
                              heroTag: item['heroTag'],
                            )));
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 130.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          color: lightGreyColor,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Hero(
                          tag: item['heroTag'],
                          child: Container(
                            width: 130.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(item['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.1, 0.5, 0.9],
                              colors: [
                                blackColor.withOpacity(0.0),
                                blackColor.withOpacity(0.3),
                                blackColor.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(fixPadding),
                                child: Text(
                                  item['title'],
                                  style: white14MediumTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  flatAbsWorkoutPlan() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0, 0.0, fixPadding * 2.0, fixPadding * 2.0),
          child: Text(
            'Flat Abs Workout Plan',
            style: primaryColor16MediumTextStyle,
          ),
        ),
        Container(
          width: double.infinity,
          height: 204.0,
          child: ListView.builder(
            itemCount: flatAbsWorkoutList.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = flatAbsWorkoutList[index];
              return Padding(
                padding: (index == 0)
                    ? EdgeInsets.only(
                        left: fixPadding * 2.0,
                        right: fixPadding * 1.5,
                        top: 2.0,
                        bottom: 2.0)
                    : (index == flatAbsWorkoutList.length - 1)
                        ? EdgeInsets.only(
                            right: fixPadding * 2.0, top: 2.0, bottom: 2.0)
                        : EdgeInsets.only(
                            right: fixPadding * 1.5, top: 2.0, bottom: 2.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 600),
                            child: WorkoutDetail(
                              title: item['title'],
                              image: item['image'],
                              heroTag: item['heroTag'],
                            )));
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 130.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          color: lightGreyColor,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Hero(
                          tag: item['heroTag'],
                          child: Container(
                            width: 130.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(item['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.1, 0.5, 0.9],
                              colors: [
                                blackColor.withOpacity(0.0),
                                blackColor.withOpacity(0.3),
                                blackColor.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(fixPadding),
                                child: Text(
                                  item['title'],
                                  style: white14MediumTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
