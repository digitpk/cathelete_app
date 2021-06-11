import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cathelete/blocs/internet_bloc.dart';
import 'package:cathelete/blocs/sign_in_bloc.dart';
import 'package:cathelete/pages/done.dart';
import 'package:cathelete/HomeWidget.dart';
import 'package:cathelete/pages/forgot_password.dart';
import 'package:cathelete/utils/icons.dart';
import 'package:cathelete/utils/next_screen.dart';
import 'package:cathelete/utils/snacbar.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  final String tag;
  SignInPage({Key key, this.tag}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool offsecureText = true;
  Icon lockIcon = LockIcon().lock;
  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool signInStart = false;
  bool signInComplete = false;
  String email;
  String pass;

  @override
  void initState() {
    super.initState();
  }

  void lockPressed() {
    if (offsecureText == true) {
      setState(() {
        offsecureText = false;
        lockIcon = LockIcon().open;
      });
    } else {
      setState(() {
        offsecureText = true;
        lockIcon = LockIcon().lock;
      });
    }
  }

  handleSignInwithemailPassword() async {
    final InternetBloc ib = Provider.of<InternetBloc>(context, listen: false);
    final SignInBloc sb = Provider.of<SignInBloc>(context, listen: false);
    setState(() {
      signInStart = true;
    });
    await ib.checkInternet();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      FocusScope.of(context).requestFocus(new FocusNode());
      setState(() {
        signInStart = true;
      });
      sb.signInwithEmailPassword(email, pass).then((_) async {
        print(sb.login_response);
        if (sb.hasError == true && sb.errorCode == 'internet_connection') {
          openSnacbar(_scaffoldKey, 'no internet'.tr());
          setState(() {
            signInStart = false;
          });
        } else if (sb.is_logged_in == true) {
          setState(() {
            signInComplete = true;
          });
          afterSignIn();
        } else {
          setState(() {
            signInStart = false;
          });
          openSnacbar(_scaffoldKey, sb.login_response);
        }
      });
    }
  }

  afterSignIn() {
    if (widget.tag == null) {
      nextScreenReplace(context, DonePage());
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text('sign in',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900))
                    .tr(),
                Text('follow the simple steps',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).secondaryHeaderColor))
                    .tr(),
                SizedBox(
                  height: 80,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'username@mail.com', labelText: 'Email'),
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.length == 0) return "Email can't be empty";
                    return null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: offsecureText,
                  controller: passCtrl,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    //prefixIcon: Icon(Icons.vpn_key),
                    suffixIcon: IconButton(
                        icon: lockIcon,
                        onPressed: () {
                          lockPressed();
                        }),
                  ),
                  validator: (String value) {
                    if (value.length == 0) return "Password can't be empty";
                    return null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      pass = value;
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),

                // Container(
                //   alignment: Alignment.centerRight,
                //   child: FlatButton(
                //     child: Text(
                //       'forgot password?',
                //       style: TextStyle(color: Theme.of(context).primaryColor),
                //     ).tr(),
                //     onPressed: () {
                //       //nextScreen(context, ForgotPasswordPage());
                //       Navigator.push(
                //           context,
                //           CupertinoPageRoute(
                //               builder: (context) => ForgotPasswordPage()));
                //     },
                //   ),
                // ),
                Container(
                  height: 45,
                  child: RaisedButton(
                      color: Colors.deepPurpleAccent,
                      child: signInStart == false
                          ? Text('sign in',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))
                              .tr()
                          : signInComplete == false
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )
                              : Text('sign in successful!',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white))
                                  .tr(),
                      onPressed: () {
                        print('ok');
                        handleSignInwithemailPassword();
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Forgot Password Option Is Temporarily Disabled.',
                      style: TextStyle(fontSize: 13.0)),
                ),
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text("don't have an account?").tr(),
                //     FlatButton(
                //       child: Text('sign up',
                //               style: TextStyle(
                //                   color: Theme.of(context).primaryColor))
                //           .tr(),
                //       onPressed: () {
                //         nextScreenReplace(context, SignUpPage());
                //       },
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
