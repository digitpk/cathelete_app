import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:cathelete/config/config.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:cathelete/pages/profile.dart';
import 'package:cathelete/pages/coming_soon.dart';
import 'package:cathelete/pages/sign_in.dart';
import 'package:cathelete/blocs/sign_in_bloc.dart';
import 'package:cathelete/pages/guest_user.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:cathelete/pages/dashboard.dart';
import 'package:cathelete/pages/news/cathelete.dart';
import 'package:cathelete/cards/diet_home_card.dart';
import 'package:cathelete/utils/next_screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey webViewKey = GlobalKey();

  TabController _controller;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    ComingSoonPage(),
    ComingSoonPage(),
    ComingSoonPage(),
    ComingSoonPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  PageController _pageController = PageController();
  DateTime currentBackPressTime;

  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.video_collection_outlined,
    Icons.save,
    Icons.account_circle_outlined,
    Icons.accessibility_new_outlined,
  ];

  @override
  void dispose() {
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInBloc>(
      builder: (context, SignInBloc, child) => Scaffold(
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 15,
              title: Text('Home').tr(),
              elevation: 1,
              actions: <Widget>[
                IconButton(
                  icon: Icon(LineIcons.userCircle, size: 30),
                  onPressed: () {
                    nextScreen(context, ProfilePage());
                  },
                ),
                SizedBox(
                  width: 5,
                )
              ],
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        }, body: Builder(
          builder: (BuildContext context) {
            final innerScrollController = PrimaryScrollController.of(context);
            return SignInBloc.is_logged_in != true
                ? GuestUserUI()
                : Container(
                    child: Center(
                      child: _widgetOptions.elementAt(_selectedIndex),
                    ),
                  );
          },
        )),
        bottomNavigationBar: SignInBloc.is_logged_in != true
            ? null
            : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300],
                      hoverColor: Config().appColor,
                      gap: 8,
                      activeColor: Colors.white,
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      duration: Duration(milliseconds: 400),
                      tabBackgroundColor: Config().appColor,
                      color: Colors.black,
                      tabs: [
                        GButton(
                          icon: LineIcons.home,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.voice_chat_outlined,
                          text: 'Zoom',
                        ),
                        GButton(
                          icon: Icons.chat_bubble_outline_outlined,
                          text: 'Chat',
                        ),
                        GButton(
                          icon: LineIcons.shoppingBag,
                          text: 'Shop',
                        ),
                        GButton(
                          icon: LineIcons.newspaper,
                          text: 'Insight',
                        ),
                      ],
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
