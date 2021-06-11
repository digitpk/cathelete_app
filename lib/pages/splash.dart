import 'package:flutter/material.dart';
import 'package:cathelete/config/config.dart';
import 'package:cathelete/pages/sign_in.dart';
import 'package:provider/provider.dart';

import '../blocs/sign_in_bloc.dart';
import '../utils/next_screen.dart';
import 'package:cathelete/pages/home.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  afterSplash() {
    final SignInBloc sb = Provider.of<SignInBloc>(context, listen: false);
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      sb.refreshLogin();
      print('***********');
      print(sb.login_email);
      print('***********');
      if (sb.is_logged_in == true) {
        nextScreenReplace(context, HomePage());
      } else {
        nextScreenReplace(context, SignInPage());
      }
    });
  }

  @override
  void initState() {
    afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
            child: Image(
          image: AssetImage(Config().splashIcon),
          height: 120,
          width: 120,
          fit: BoxFit.contain,
        )));
  }
}
