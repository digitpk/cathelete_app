import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:launch_review/launch_review.dart';
import 'package:line_icons/line_icons.dart';
import 'package:cathelete/blocs/theme_bloc.dart';
import 'package:cathelete/pages/edit_profile.dart';
import 'package:cathelete/pages/sign_in.dart';
import 'package:cathelete/blocs/sign_in_bloc.dart';
import 'package:cathelete/pages/guest_user.dart';
import 'package:cathelete/widgets/language.dart';
import 'package:cathelete/widgets/launch_url.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:octo_image/octo_image.dart';
import 'package:cathelete/utils/cached_image.dart';
import '../blocs/sign_in_bloc.dart';
import '../config/config.dart';
import '../utils/next_screen.dart';
import 'package:cathelete/HomeWidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  openAboutDialog() {
    final sb = context.read<SignInBloc>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AboutDialog(
            applicationName: Config().appName,
            applicationIcon: Image(
              image: AssetImage(Config().splashIcon),
              height: 30,
              width: 30,
            ),
            applicationVersion: sb.appVersion,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final sb = context.watch<SignInBloc>();
    return Consumer<SignInBloc>(
      builder: (context, SignInBloc, child) => Scaffold(
          appBar: AppBar(
            title: Text('profile').tr(),
            centerTitle: false,
          ),
          body: ListView(
            padding: EdgeInsets.fromLTRB(15, 20, 20, 50),
            children: [
              SignInBloc.is_logged_in == false ? GuestUserUI() : UserUI(),
              Text(
                "General Option",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                height: 3,
              ),
              ListTile(
                title: Text('contact us').tr(),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(Feather.mail, size: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Feather.chevron_right,
                  size: 20,
                ),
                onTap: () async => await launch(
                    'mailto:${Config().supportEmail}?subject= Subject write here&body= Message write here'),
              ),
              // Divider(
              //   height: 3,
              // ),
              // ListTile(
              //   title: Text('rate this app').tr(),
              //   leading: Container(
              //     height: 30,
              //     width: 30,
              //     decoration: BoxDecoration(
              //         color: Colors.orangeAccent,
              //         borderRadius: BorderRadius.circular(5)),
              //     child: Icon(Feather.star, size: 20, color: Colors.white),
              //   ),
              //   trailing: Icon(
              //     Feather.chevron_right,
              //     size: 20,
              //   ),
              //   onTap: () async => LaunchReview.launch(
              //       androidAppId: sb.packageName, iOSAppId: Config().iOSAppId),
              // ),
              Divider(
                height: 3,
              ),
              ListTile(
                title: Text('privacy policy').tr(),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(Feather.lock, size: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Feather.chevron_right,
                  size: 20,
                ),
                onTap: () async {
                  launchURL(context, Config().privacyPolicyUrl);
                },
              ),
              Divider(
                height: 3,
              ),
              ListTile(
                title: Text('about us').tr(),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(Feather.info, size: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Feather.chevron_right,
                  size: 20,
                ),
                onTap: () async {
                  launchURL(context, Config().ourWebsiteUrl);
                },
              ),
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class UserUI extends StatelessWidget {
  const UserUI({Key key}) : super(key: key);

  void LogOutUser(context) {
    final SignInBloc sb = Provider.of<SignInBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final sb = context.watch<SignInBloc>();
    return Column(
      children: [
        Container(
          height: 200,
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: sb.login_profile_image != null
                    ? CustomCacheImage(
                        imageUrl: Config().current_protocol_domain +
                            sb.login_thumb_profile_url,
                        radius: 100.0)
                    : Text(
                        '${sb.login_firstname[0]}'.toUpperCase(),
                        style: TextStyle(fontSize: 45, color: Colors.black),
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                sb.login_firstname.toUpperCase() +
                    ' ' +
                    sb.login_lastname.toUpperCase(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(sb.login_email),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.mail, size: 20, color: Colors.white),
          ),
        ),
        Divider(
          height: 3,
        ),
        ListTile(
          title: Text(sb.login_phonenumber.length > 0
              ? sb.login_phonenumber
              : 'not available'),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.phone, size: 20, color: Colors.white),
          ),
        ),
        Divider(
          height: 3,
        ),
        ListTile(
          title: Text(sb.login_last_login.length > 0
              ? sb.login_last_login
              : 'not available'),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.log_in, size: 20, color: Colors.white),
          ),
        ),
        Divider(
          height: 3,
        ),
        ListTile(
          title: Text(sb.login_token),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Icons.vpn_key_outlined, size: 20, color: Colors.white),
          ),
        ),
        Divider(
          height: 3,
        ),
        // ListTile(
        //     title: Text('edit profile').tr(),
        //     leading: Container(
        //       height: 30,
        //       width: 30,
        //       decoration: BoxDecoration(
        //           color: Colors.purpleAccent,
        //           borderRadius: BorderRadius.circular(5)),
        //       child: Icon(Feather.edit_3, size: 20, color: Colors.white),
        //     ),
        //     trailing: Icon(
        //       Feather.chevron_right,
        //       size: 20,
        //     ),
        //     onTap: () => nextScreen(
        //         context, EditProfile(name: sb.name, imageUrl: sb.imageUrl))),
        Divider(
          height: 3,
        ),
        ListTile(
          title: Text('logout').tr(),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.log_out, size: 20, color: Colors.white),
          ),
          trailing: Icon(
            Feather.chevron_right,
            size: 20,
          ),
          onTap: () => openLogoutDialog(context),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  void openLogoutDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('logout title').tr(),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('no').tr(),
                onPressed: () => Navigator.pop(context),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('yes').tr(),
                onPressed: () {
                  print('ok');
                  Navigator.pop(context);
                  final SignInBloc sb =
                      Provider.of<SignInBloc>(context, listen: false);
                  sb.userSignout();
                  nextScreenCloseOthers(context, SignInPage());
                },
              )
            ],
          );
        });
  }
}
