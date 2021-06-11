import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cathelete/utils/empty.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ComingSoonPage extends StatefulWidget {
  ComingSoonPage({Key key}) : super(key: key);

  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {},
          child: EmptyPage(
              icon: Icons.schedule,
              message: 'Coming Soon',
              message1: 'This feature is under development'),
        ),
        onRefresh: () async {},
      ),
    );
  }
}
