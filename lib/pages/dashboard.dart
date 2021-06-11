import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:cathelete/utils/cached_image.dart';
import 'package:cathelete/blocs/sign_in_bloc.dart';
import 'package:cathelete/config/config.dart';
import 'package:cathelete/utils/next_screen.dart';
import 'package:cathelete/pages/guest_user.dart';
import 'package:cathelete/cards/diet_home_card.dart';
import 'package:cathelete/cards/fitnessHomeCard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final sb = context.watch<SignInBloc>();
    return Consumer<SignInBloc>(
      builder: (context, SignInBloc, child) => Scaffold(
        body: SignInBloc.is_logged_in == false
            ? GuestUserUI()
            : DashboardPageUI(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DashboardPageUI extends StatefulWidget {
  const DashboardPageUI({Key key}) : super(key: key);

  @override
  _DashboardPageUIState createState() => _DashboardPageUIState();
}

class _DashboardPageUIState extends State<DashboardPageUI>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Container(
            margin: EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
            color: Colors.white,
            child: Column(
              // padding: EdgeInsets.fromLTRB(15, 20, 20, 50),
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        color: Colors.white,
                        child: Text(
                          'My Diet Plan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(
                        height: 2,
                      ),
                      DietHomeCard(
                        data: {'title': 'This is title'},
                        heroTag: 'string',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        color: Colors.white,
                        child: Text(
                          'My Fitness Plan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(
                        height: 2,
                      ),
                      FitnessHomeCard(
                        data: {'title': 'This is title'},
                        heroTag: 'string',
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
