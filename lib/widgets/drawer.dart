import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cathelete/blocs/sign_in_bloc.dart';
import 'package:cathelete/blocs/theme_bloc.dart';
import 'package:cathelete/config/config.dart';
import 'package:cathelete/models/custom_color.dart';
import 'package:cathelete/pages/profile.dart';
import 'package:cathelete/utils/app_name.dart';
import 'package:cathelete/utils/next_screen.dart';
import 'package:cathelete/widgets/language.dart';
import 'package:cathelete/widgets/launch_url.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import '../blocs/sign_in_bloc.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sb = context.watch<SignInBloc>();

    return Consumer<SignInBloc>(
      builder: (context, SignInBloc, child) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: SignInBloc.login_email != null
                    ? Config().appColor
                    : CustomColor().drawerHeaderColorLight,
                padding: EdgeInsets.all(15),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'beta  ${sb.appVersion}',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    SignInBloc.login_email == null
                        ? Image.asset('assets/icon.png',
                            fit: BoxFit.cover, height: 20)
                        : Icon(
                            Icons.account_circle_rounded,
                            size: 100,
                            color: Colors.white,
                          ),
                    SignInBloc.login_email == null
                        ? Text(
                            'Version: ${sb.appVersion}',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                          )
                        : Text(
                            '${SignInBloc.login_email}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                  ],
                ),
              ),
              Container(
                child: ExpansionTile(
                  title: Text(
                    'Profile',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  children: <Widget>[
                    ListTile(
                        title: Text(
                          'My Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ).tr(),
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                context.watch<ThemeBloc>().darkTheme == false
                                    ? CustomColor().drawerHeaderColorLight
                                    : CustomColor().drawerHeaderColorDark,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey[600],
                              size: 14,
                            )),
                        onTap: () async {
                          Navigator.pop(context);
                          nextScreen(context, ProfilePage());
                        }),
                    ListTile(
                        title: Text(
                          'About',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ).tr(),
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                context.watch<ThemeBloc>().darkTheme == false
                                    ? CustomColor().drawerHeaderColorLight
                                    : CustomColor().drawerHeaderColorDark,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey[600],
                              size: 14,
                            )),
                        onTap: () async {
                          Navigator.pop(context);
                          launchURL(context, Config().aboutUrl);
                        }),
                    ListTile(
                        title: Text(
                          'Contact',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ).tr(),
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                context.watch<ThemeBloc>().darkTheme == false
                                    ? CustomColor().drawerHeaderColorLight
                                    : CustomColor().drawerHeaderColorDark,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey[600],
                              size: 14,
                            )),
                        onTap: () async {
                          Navigator.pop(context);
                          await launch(
                              'mailto:${Config().supportEmail}?subject=Contact us - ${Config().appName} App&body=Message write here');
                        }),
                    ListTile(
                        title: Text(
                          'Terms',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ).tr(),
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                context.watch<ThemeBloc>().darkTheme == false
                                    ? CustomColor().drawerHeaderColorLight
                                    : CustomColor().drawerHeaderColorDark,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey[600],
                              size: 14,
                            )),
                        onTap: () async {
                          Navigator.pop(context);
                          launchURL(context, Config().termsUrl);
                        }),
                    ListTile(
                        title: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ).tr(),
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                context.watch<ThemeBloc>().darkTheme == false
                                    ? CustomColor().drawerHeaderColorLight
                                    : CustomColor().drawerHeaderColorDark,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.grey[600],
                              size: 14,
                            )),
                        onTap: () async {
                          Navigator.pop(context);
                          launchURL(context, Config().privacyPolicyUrl);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
