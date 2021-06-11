import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:cathelete/utils/cached_image.dart';
import 'package:cathelete/pages/sign_in.dart';
import 'package:cathelete/blocs/sign_in_bloc.dart';
import 'package:cathelete/config/config.dart';
import 'package:cathelete/utils/next_screen.dart';

class GuestUserUI extends StatelessWidget {
  const GuestUserUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360.0),
                child: Image.asset(
                  'assets/user.png',
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child:
                  Text('You are not logged in', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // ignore: deprecated_member_use
              child: RaisedButton.icon(
                  color: Config().appColor,
                  onPressed: () {
                    nextScreenPopup(
                        context,
                        SignInPage(
                          tag: 'popup',
                        ));
                  },
                  icon: Icon(
                    Icons.login_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
