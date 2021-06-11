import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cathelete/utils/next_screen.dart';
import 'package:cathelete/config/config.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class DietPage extends StatefulWidget {
  dynamic data;
  String heroTag;
  DietPage({Key key, @required this.data, @required this.heroTag})
      : super(key: key);

  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  dynamic data;
  String heroTag;
  _DietPageState({Key key, @required this.data, @required this.heroTag});

  bool mon_diet_schedule = false;
  bool tue_diet_schedule = false;
  bool wed_diet_schedule = false;
  bool thu_diet_schedule = false;
  bool fri_diet_schedule = false;
  bool sat_diet_schedule = false;
  bool sun_diet_schedule = false;

  void resetDietScheduleView() {
    setState(() {
      mon_diet_schedule = false;
      tue_diet_schedule = false;
      wed_diet_schedule = false;
      thu_diet_schedule = false;
      fri_diet_schedule = false;
      sat_diet_schedule = false;
      sun_diet_schedule = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Diet Plan'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
            children: <Widget>[
              Column(
                // padding: EdgeInsets.fromLTRB(15, 20, 20, 50),
                children: [
                  Container(
                      child: InkWell(
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
                                  tag: 'string2334q352ddf43t34wt',
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.grey[200],
                                                blurRadius: 1,
                                                offset: Offset(1, 1))
                                          ],
                                        ),
                                        child: Image.asset(
                                          'assets/diet_plan.png',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'My Diet Plan',
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
                                        'Today - 530 kcal',
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
                                        'Tomorrow - 470 kcal',
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
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Monday schedule",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  onTap: () {
                                    if (mon_diet_schedule == true) {
                                      setState(() {
                                        mon_diet_schedule = false;
                                      });
                                    } else {
                                      setState(() {
                                        mon_diet_schedule = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Visibility(
                            visible: mon_diet_schedule,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Theme.of(context).shadowColor,
                                            blurRadius: 10,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('BreakFast',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              Text('12 PM',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                            ],
                                          ),
                                          Spacer(),
                                          Text('369 cal',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Cucumber Raita',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('53 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Green Salad',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('36 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Vegetable Curry',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('23 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemWidth: 340,
                              itemHeight: 3 * 135.0,
                              itemCount: 3,
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              layout: SwiperLayout.TINDER,
                              pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter),
                              customLayoutOption: new CustomLayoutOption(
                                      startIndex: -1, stateCount: 3)
                                  .addRotate([
                                0.0 / 180,
                                0.0,
                                45.0 / 180
                              ]).addTranslate([
                                new Offset(-340.0, -40.0),
                                new Offset(0.0, 0.0),
                                new Offset(340.0, -40.0)
                              ]),
                              // control:SwiperControl(),
                            ),
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
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Tuesday schedule",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  onTap: () {
                                    if (tue_diet_schedule == true) {
                                      setState(() {
                                        tue_diet_schedule = false;
                                      });
                                    } else {
                                      setState(() {
                                        tue_diet_schedule = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Visibility(
                            visible: tue_diet_schedule,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Theme.of(context).shadowColor,
                                            blurRadius: 10,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('BreakFast',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              Text('12 PM',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                            ],
                                          ),
                                          Spacer(),
                                          Text('369 cal',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Cucumber Raita',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('53 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Green Salad',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('36 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Vegetable Curry',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('23 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemWidth: 340,
                              itemHeight: 3 * 135.0,
                              itemCount: 3,
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              layout: SwiperLayout.TINDER,
                              pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter),
                              customLayoutOption: new CustomLayoutOption(
                                      startIndex: -1, stateCount: 3)
                                  .addRotate([
                                0.0 / 180,
                                0.0,
                                45.0 / 180
                              ]).addTranslate([
                                new Offset(-340.0, -40.0),
                                new Offset(0.0, 0.0),
                                new Offset(340.0, -40.0)
                              ]),
                              // control:SwiperControl(),
                            ),
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
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Wednesday schedule",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  onTap: () {
                                    if (wed_diet_schedule == true) {
                                      setState(() {
                                        wed_diet_schedule = false;
                                      });
                                    } else {
                                      setState(() {
                                        wed_diet_schedule = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Visibility(
                            visible: wed_diet_schedule,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Theme.of(context).shadowColor,
                                            blurRadius: 10,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('BreakFast',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              Text('12 PM',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                            ],
                                          ),
                                          Spacer(),
                                          Text('369 cal',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Cucumber Raita',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('53 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Green Salad',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('36 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Vegetable Curry',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('23 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemWidth: 340,
                              itemHeight: 3 * 135.0,
                              itemCount: 3,
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              layout: SwiperLayout.TINDER,
                              pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter),
                              customLayoutOption: new CustomLayoutOption(
                                      startIndex: -1, stateCount: 3)
                                  .addRotate([
                                0.0 / 180,
                                0.0,
                                45.0 / 180
                              ]).addTranslate([
                                new Offset(-340.0, -40.0),
                                new Offset(0.0, 0.0),
                                new Offset(340.0, -40.0)
                              ]),
                              // control:SwiperControl(),
                            ),
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
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Thursday schedule",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  onTap: () {
                                    if (thu_diet_schedule == true) {
                                      setState(() {
                                        thu_diet_schedule = false;
                                      });
                                    } else {
                                      setState(() {
                                        thu_diet_schedule = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Visibility(
                            visible: thu_diet_schedule,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Theme.of(context).shadowColor,
                                            blurRadius: 10,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('BreakFast',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              Text('12 PM',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                            ],
                                          ),
                                          Spacer(),
                                          Text('369 cal',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Cucumber Raita',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('53 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Green Salad',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('36 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Vegetable Curry',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('23 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemWidth: 340,
                              itemHeight: 3 * 135.0,
                              itemCount: 3,
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              layout: SwiperLayout.TINDER,
                              pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter),
                              customLayoutOption: new CustomLayoutOption(
                                      startIndex: -1, stateCount: 3)
                                  .addRotate([
                                0.0 / 180,
                                0.0,
                                45.0 / 180
                              ]).addTranslate([
                                new Offset(-340.0, -40.0),
                                new Offset(0.0, 0.0),
                                new Offset(340.0, -40.0)
                              ]),
                              // control:SwiperControl(),
                            ),
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
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Friday schedule",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  onTap: () {
                                    if (fri_diet_schedule == true) {
                                      setState(() {
                                        fri_diet_schedule = false;
                                      });
                                    } else {
                                      setState(() {
                                        fri_diet_schedule = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Visibility(
                            visible: fri_diet_schedule,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Theme.of(context).shadowColor,
                                            blurRadius: 10,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('BreakFast',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              Text('12 PM',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                            ],
                                          ),
                                          Spacer(),
                                          Text('369 cal',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Cucumber Raita',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('53 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Green Salad',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('36 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Vegetable Curry',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('23 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemWidth: 340,
                              itemHeight: 3 * 135.0,
                              itemCount: 3,
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              layout: SwiperLayout.TINDER,
                              pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter),
                              customLayoutOption: new CustomLayoutOption(
                                      startIndex: -1, stateCount: 3)
                                  .addRotate([
                                0.0 / 180,
                                0.0,
                                45.0 / 180
                              ]).addTranslate([
                                new Offset(-340.0, -40.0),
                                new Offset(0.0, 0.0),
                                new Offset(340.0, -40.0)
                              ]),
                              // control:SwiperControl(),
                            ),
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
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Saturday schedule",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  onTap: () {
                                    if (sat_diet_schedule == true) {
                                      setState(() {
                                        sat_diet_schedule = false;
                                      });
                                    } else {
                                      setState(() {
                                        sat_diet_schedule = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Visibility(
                            visible: sat_diet_schedule,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Theme.of(context).shadowColor,
                                            blurRadius: 10,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('BreakFast',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              Text('12 PM',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                            ],
                                          ),
                                          Spacer(),
                                          Text('369 cal',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Cucumber Raita',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('53 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Green Salad',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('36 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Vegetable Curry',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('23 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemWidth: 340,
                              itemHeight: 3 * 135.0,
                              itemCount: 3,
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              layout: SwiperLayout.TINDER,
                              pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter),
                              customLayoutOption: new CustomLayoutOption(
                                      startIndex: -1, stateCount: 3)
                                  .addRotate([
                                0.0 / 180,
                                0.0,
                                45.0 / 180
                              ]).addTranslate([
                                new Offset(-340.0, -40.0),
                                new Offset(0.0, 0.0),
                                new Offset(340.0, -40.0)
                              ]),
                              // control:SwiperControl(),
                            ),
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
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Sunday schedule",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                child: InkWell(
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  onTap: () {
                                    if (sun_diet_schedule == true) {
                                      setState(() {
                                        sun_diet_schedule = false;
                                      });
                                    } else {
                                      setState(() {
                                        sun_diet_schedule = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Visibility(
                            visible: sun_diet_schedule,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Theme.of(context).shadowColor,
                                            blurRadius: 10,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('BreakFast',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                              Text('12 PM',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                            ],
                                          ),
                                          Spacer(),
                                          Text('369 cal',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Cucumber Raita',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('53 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Green Salad',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('36 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 20, right: 20),
                                            child: Image.asset(
                                              'assets/diet1.png',
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('1 katori, Vegetable Curry',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .secondaryHeaderColor)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('23 cals',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Theme.of(context)
                                                          .primaryColor)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemWidth: 340,
                              itemHeight: 3 * 135.0,
                              itemCount: 3,
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              layout: SwiperLayout.TINDER,
                              pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter),
                              customLayoutOption: new CustomLayoutOption(
                                      startIndex: -1, stateCount: 3)
                                  .addRotate([
                                0.0 / 180,
                                0.0,
                                45.0 / 180
                              ]).addTranslate([
                                new Offset(-340.0, -40.0),
                                new Offset(0.0, 0.0),
                                new Offset(340.0, -40.0)
                              ]),
                              // control:SwiperControl(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
