import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:share/share.dart';

import 'AdsInfo.dart';
import 'ColorCategory.dart';
import 'Constants.dart';
import 'SizeConfig.dart';
import 'WidgetWorkout.dart';
import 'Widgets.dart';
import 'db/DataHelper.dart';
import 'generated/l10n.dart';
import 'models/ModelExerciseDetail.dart';
import 'models/ModelWorkoutExerciseList.dart';
import 'models/ModelWorkoutList.dart';

// ignore: must_be_immutable
class WidgetWorkoutExerciseList extends StatefulWidget {
  ModelWorkoutList _modelWorkoutList;

  WidgetWorkoutExerciseList(this._modelWorkoutList);

  @override
  _WidgetWorkoutExerciseList createState() => _WidgetWorkoutExerciseList();
}

class _WidgetWorkoutExerciseList extends State<WidgetWorkoutExerciseList> {
  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  List<ModelWorkoutExerciseList> _list = [];
  DataHelper _dataHelper = DataHelper.instance;
  int getCal = 0;
  int getTime = 0;
  int getTotalWorkout = 0;
  List priceList;

  // AnimationController animationController;

  @override
  void initState() {
    _calcTotal();
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

  PageController controller = PageController();
  // InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: greyWhite,
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
                                      tag: widget._modelWorkoutList.id,
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        height:
                                            SizeConfig.safeBlockVertical * 22,
                                        color: greyWhite,
                                        // color: greyWhite,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 7,
                                                ),
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child:
                                                        getMediumBoldTextWithMaxLine(
                                                      widget._modelWorkoutList
                                                          .name,
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
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 3,
                                                    bottom: 3),
                                                child: getCustomText(
                                                    S
                                                        .of(context)
                                                        .transformation,
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
                                                              Icons
                                                                  .chevron_right,
                                                              size: 20),
                                                        ),
                                                        WidgetSpan(
                                                            child: SizedBox(
                                                          width: 10,
                                                        )),
                                                        TextSpan(
                                                            text: S
                                                                .of(context)
                                                                .beginner,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontFamily:
                                                                    Constants
                                                                        .fontsFamily,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
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
                                                          child: Icon(
                                                              Icons.whatshot,
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
                                                                color: Colors
                                                                    .black87,
                                                                fontFamily:
                                                                    Constants
                                                                        .fontsFamily,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
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
                                                          child: Icon(
                                                              Icons.timer,
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
                                                                color: Colors
                                                                    .black87,
                                                                fontFamily:
                                                                    Constants
                                                                        .fontsFamily,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
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
                                    child: FutureBuilder<
                                        List<ModelWorkoutExerciseList>>(
                                      future: _dataHelper
                                          .getWorkoutExerciseListById(
                                              widget._modelWorkoutList.id),
                                      builder: (context, snapshot) {
                                        print("datasize===${snapshot.hasData}");
                                        if (snapshot.hasData) {
                                          _list = snapshot.data;
                                          List<ModelWorkoutExerciseList>
                                              _exerciseList = snapshot.data;
                                          // print("workoutlistsize===${_exerciseList.length}");
                                          return ListView.builder(
                                            itemCount: _exerciseList.length,
                                            padding: EdgeInsets.only(
                                                bottom: 25, top: 15),
                                            primary: false,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              ModelWorkoutExerciseList
                                                  _modelExerciseList =
                                                  _exerciseList[index];
                                              return FutureBuilder<
                                                  ModelExerciseDetail>(
                                                future: _dataHelper
                                                    .getExerciseDetailById(
                                                        _modelExerciseList
                                                            .exerciseId),
                                                builder: (context, snapshot) {
                                                  ModelExerciseDetail
                                                      exerciseDetail =
                                                      snapshot.data;
                                                  // print(
                                                  //     "getDatas==--${exerciseDetail.image}");
                                                  if (snapshot.hasData) {
                                                    return InkWell(
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            7)),
                                                            color:
                                                                Colors.white),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 7,
                                                                      top: 7,
                                                                      bottom: 7,
                                                                      right:
                                                                          15),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .black12),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              12))),
                                                              child:
                                                                  Image.asset(
                                                                "${Constants.assetsGifPath}${exerciseDetail.image}",
                                                                height: SizeConfig
                                                                        .safeBlockHorizontal *
                                                                    20,
                                                                width: SizeConfig
                                                                        .safeBlockHorizontal *
                                                                    20,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  getSmallBoldTextWithMaxLine(
                                                                      exerciseDetail
                                                                          .name,
                                                                      Colors
                                                                          .black87,
                                                                      1),
                                                                  getExtraSmallNormalTextWithMaxLine(
                                                                      "${_modelExerciseList.duration} ${S.of(context).seconds}",
                                                                      Colors
                                                                          .grey,
                                                                      1,
                                                                      TextAlign
                                                                          .start)
                                                                ],
                                                              ),
                                                              flex: 1,
                                                            ),
                                                            IconButton(
                                                              onPressed: () {
                                                                showBottomDialog(
                                                                    exerciseDetail);
                                                              },
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(7),
                                                              icon: Icon(
                                                                Icons
                                                                    .more_vert_rounded,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        showBottomDialog(
                                                            exerciseDetail);
                                                      },
                                                    );
                                                  } else {
                                                    return getProgressDialog();
                                                  }
                                                },
                                              );
                                            },
                                          );
                                        } else {
                                          return getProgressDialog();
                                        }
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                            // shape: RoundedRectangleBorder(
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(20.0))),
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return WidgetWorkout(_list);
                                },
                              ));
                            },

                            textColor: Colors.white,
                            color: greenButton,
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            // padding: EdgeInsets.all(5),

                            child: getCustomText("START WORKOUT", Colors.white,
                                1, TextAlign.center, FontWeight.w600, 17),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
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

  void showBottomDialog(ModelExerciseDetail exerciseDetail) {
    showModalBottomSheet<void>(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: bgDarkWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: SizeConfig.safeBlockVertical * 80,
          child: ListView(
            padding: EdgeInsets.all(7),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            primary: false,
            children: [
              Container(
                width: double.infinity,
                height: SizeConfig.safeBlockVertical * 40,
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    // KeepAlivePage(child:
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(children: [
                        Image.asset(
                          "${Constants.assetsGifPath}${exerciseDetail.image}",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          // )
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              // controller.jumpToPage(1);
                              controller.animateToPage(1,
                                  curve: Curves.decelerate,
                                  duration: Duration(milliseconds: 300));
                            },
                            padding: EdgeInsets.all(7),
                            icon: Icon(
                              Icons.videocam,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ]),
                    ),

                    Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(children: <Widget>[
                          // Expanded(
                          //   child: Container(
                          //     width: double.infinity,
                          //     height: double.infinity,
                          //     child: InAppWebView(
                          //       initialUrl:
                          //           "https://www.youtube.com/embed/ml6cT4AZdqI",
                          //       initialHeaders: {},
                          //       initialOptions: InAppWebViewGroupOptions(
                          //           crossPlatform: InAppWebViewOptions(
                          //         debuggingEnabled: true,
                          //       )),
                          //       onWebViewCreated:
                          //           (InAppWebViewController controller) {
                          //         webView = controller;
                          //       },
                          //       onLoadStart: (InAppWebViewController controller,
                          //           String url) {},
                          //       onLoadStop: (InAppWebViewController controller,
                          //           String url) {},
                          //     ),
                          //   ),
                          // ),
                        ]))
                    // )
                    ,
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(7),
                child: Text(
                  exerciseDetail.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontFamily: Constants.fontsFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              getCustomText("How to perform", Colors.black, 1, TextAlign.start,
                  FontWeight.w600, 18),
              SizedBox(
                height: 7,
              ),
              HtmlWidget(
                exerciseDetail.detail,
                textStyle: TextStyle(
                    wordSpacing: 2,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: Constants.fontsFamily,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        );
      },
    );
  }
}
