import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';

import 'AdsInfo.dart';
import 'ColorCategory.dart';
import 'Constants.dart';
import 'SizeConfig.dart';
import 'WidgetWorkoutExerciseList.dart';
import 'Widgets.dart';
import 'db/DataHelper.dart';
import 'generated/l10n.dart';
import 'models/ModelChallengesMainCat.dart';
import 'models/ModelWorkoutList.dart';

// ignore: must_be_immutable
class WidgetChallengesExerciseList extends StatefulWidget {
  ModelChallengesMainCat _modelWorkoutList;

  WidgetChallengesExerciseList(this._modelWorkoutList);

  @override
  _WidgetChallengesExerciseList createState() =>
      _WidgetChallengesExerciseList();
}

class _WidgetChallengesExerciseList
    extends State<WidgetChallengesExerciseList> {
  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  int getCal = 0;
  int getTime = 0;
  int getTotalWorkout = 0;
  List priceList;

  DataHelper _dataHelper = DataHelper.instance;
  List<ModelWorkoutList> _workoutList = [];

  // AnimationController animationController;
  void sendToWorkoutList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return WidgetWorkoutExerciseList(_workoutList[0]);
      },
    ));
  }

  void _calcTotal() async {
    priceList = await _dataHelper.calculateTotalWorkout();
    if (priceList != null && priceList.length > 0) {
      getTotalWorkout = priceList.length;
      priceList.forEach((price) {
        getCal = getCal + price['kcal'];
      });
      print("getval=$getCal");
      getTime = getTotalWorkout * 2;
      setState(() {});
    }
  }

  @override
  void initState() {
    _calcTotal();
    _dataHelper.getWorkoutList().then((value) {
      _workoutList = value;
      // setState(() {});
    });

    super.initState();

    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  Future<void> share() async {
    Share.share(S.of(context).app_name, subject: S.of(context).app_name);
  }

  void handleClick(String value) {
    switch (value) {
      case 'Share':
        share();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      child: Scaffold(
        backgroundColor: greyWhite,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  AnimatedContainer(
                    height: _showAppbar ? 56.0 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: AppBar(
                      backgroundColor: greyWhite,
                      elevation: 0,
                      actions: <Widget>[
                        PopupMenuButton<String>(
                          onSelected: handleClick,
                          itemBuilder: (BuildContext context) {
                            return {'Share'}.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        )
                        //add buttons here
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollViewController,
                      child: Column(
                        children: <Widget>[
                          Hero(
                              tag: widget._modelWorkoutList.title,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                height: SizeConfig.safeBlockVertical * 22,
                                color: greyWhite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 7,
                                        ),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: getMediumBoldTextWithMaxLine(
                                              widget._modelWorkoutList.title,
                                              Colors.black,
                                              1,
                                            )),
                                      ),
                                      flex: 1,
                                    ),
                                    Card(
                                      color: darkGrey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 3,
                                            bottom: 3),
                                        child: getCustomText(
                                            S.of(context).transformation,
                                            Colors.black87,
                                            1,
                                            TextAlign.start,
                                            FontWeight.w600,
                                            15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Icon(
                                                      Icons.chevron_right,
                                                      size: 20),
                                                ),
                                                WidgetSpan(
                                                    child: SizedBox(
                                                  width: 10,
                                                )),
                                                TextSpan(
                                                    text:
                                                        S.of(context).beginner,
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontFamily: Constants
                                                            .fontsFamily,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Icon(Icons.whatshot,
                                                      size: 20),
                                                ),
                                                WidgetSpan(
                                                    child: SizedBox(
                                                  width: 10,
                                                )),
                                                TextSpan(
                                                    text:
                                                        "$getCal ${S.of(context).calories}",
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontFamily: Constants
                                                            .fontsFamily,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  child: Icon(Icons.timer,
                                                      size: 20),
                                                ),
                                                WidgetSpan(
                                                    child: SizedBox(
                                                  width: 10,
                                                )),
                                                TextSpan(
                                                    text:
                                                        "$getTime ${S.of(context).minutes}",
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontFamily: Constants
                                                            .fontsFamily,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                          flex: 1,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7,
                                    )
                                  ],
                                ),
                              )),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                color: Colors.white),
                            child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  top: 15, left: 7, right: 7, bottom: 40),
                              itemCount: widget._modelWorkoutList.weeks,
                              itemBuilder: (context, index) {
                                int week = index;
                                return Container(
                                  margin: EdgeInsets.all(7),
                                  padding: EdgeInsets.only(
                                      left: 7, right: 7, top: 13, bottom: 7),
                                  width: double.infinity,
                                  height: 220,
                                  // height: SizeConfig.safeBlockVertical*25,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1), //(x,y)
                                          blurRadius: 2.5,
                                        )
                                      ],
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getSmallNormalText(
                                          "${S.of(context).week}-${index + 1}",
                                          Colors.grey,
                                          TextAlign.start),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: SizedBox(),
                                              flex: 1,
                                            ),
                                            Container(
                                              width: SizeConfig
                                                      .safeBlockHorizontal *
                                                  65,
                                              color: Colors.white,
                                              child: GridView.count(
                                                crossAxisCount: 3,
                                                shrinkWrap: true,
                                                primary: false,
                                                physics:
                                                    new NeverScrollableScrollPhysics(),
                                                childAspectRatio: (((SizeConfig
                                                                .safeBlockHorizontal *
                                                            65) /
                                                        3.3) /
                                                    (200 / 3.7)),
                                                // childAspectRatio: (3 / 1.8),
                                                children:
                                                    List.generate(8, (index) {
                                                  return (index == 7)
                                                      ? Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5),
                                                            child: Image.asset(
                                                              Constants
                                                                      .assetsImagePath +
                                                                  "trophy_cup.png",
                                                              height: 42,
                                                              width: 42,
                                                              color: Colors
                                                                  .black26,
                                                            ),
                                                          ),
                                                        )
                                                      : InkWell(
                                                          child: Row(
                                                            // mainAxisSize:
                                                            //     MainAxisSize.min,
                                                            children: [
                                                              // Expanded(
                                                              //   flex: 1,
                                                              //   child: SizedBox(),
                                                              // ),
                                                              Container(
                                                                // margin:EdgeInsets.all(5) ,
                                                                child: ClipOval(
                                                                  child:
                                                                      Container(
                                                                    height: 45,
                                                                    width: 45,
                                                                    color: (week ==
                                                                                0 &&
                                                                            index ==
                                                                                0)
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .black38,
                                                                    // padding: EdgeInsets.only(left: 20,right: 20,top:10,bottom: 10),
                                                                    // padding: EdgeInsets.symmetric(horizontal: 20),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "${index + 1}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontFamily: Constants.fontsFamily,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 20),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Icon(
                                                                  Icons
                                                                      .chevron_right,
                                                                  color: Colors
                                                                      .black38,
                                                                ),
                                                                flex: 1,
                                                              )

                                                              // Expanded(
                                                              //   flex: 1,
                                                              //   child: SizedBox(),
                                                              // ),
                                                            ],
                                                          ),
                                                          onTap: () {
                                                            sendToWorkoutList(
                                                                context);
                                                          },
                                                        );
                                                  //robohash.org api provide you different images for any number you are giving
                                                }),
                                              ),
                                            ),
                                            // flex: 1,
                                            // )
                                            // ,
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(),
                                            )
                                          ],
                                        ),
                                        flex: 1,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )

                          //add your screen content here
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.all(7),
                    width: SizeConfig.safeBlockHorizontal * 55,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0))),
                      onPressed: () async {
                        sendToWorkoutList(context);
                      },
                      textColor: Colors.white,
                      color: greenButton,
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: getCustomText(S.of(context).go, Colors.white, 1,
                          TextAlign.center, FontWeight.w600, 17),
                    )),
              )
            ],
          ),
        ),
      ),
      onWillPop: () async {
        onBackClicked();
        return false;
      },
    );
  }

  void onBackClicked() {
    Navigator.of(context).pop();
  }
}
