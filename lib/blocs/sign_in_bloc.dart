// import 'package:apple_sign_in/apple_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cathelete/config/config.dart';
import 'package:xxtea/xxtea.dart';
import 'package:cathelete/blocs/internet_bloc.dart';
import 'package:provider/provider.dart';

class SignInBloc extends ChangeNotifier {
  SignInBloc() {
    checkSignIn();
    initPackageInfo();
  }

  final String defaultUserImageUrl =
      'https://www.oxfordglobal.co.uk/nextgen-omics-series-us/wp-content/uploads/sites/16/2020/03/Jianming-Xu-e5cb47b9ddeec15f595e7000717da3fe.png';

  bool _hasError = false;
  bool get hasError => _hasError;

  String _errorCode;
  String get errorCode => _errorCode;

  String timestamp;

  String _appVersion = '0.0';
  String get appVersion => _appVersion;

  String _packageName = '';
  String get packageName => _packageName;

  int _loginCode = 400;
  int get loginCode => _loginCode;

  bool _is_logged_in = false;
  bool get is_logged_in => _is_logged_in;

  String _login_email = '';
  String get login_email => _login_email;

  String _login_pass = '';

  String _login_token = '';
  String get login_token => _login_token;

  String _login_uid = '';
  String get login_uid => _login_uid;

  String _login_username = '';
  String get login_username => _login_username;

  String _login_client_id = '';
  String get login_client_id => _login_client_id;

  String _login_contact_id = '';
  String get login_contact_id => _login_contact_id;

  String _login_firstname = '';
  String get login_firstname => _login_firstname;

  String _login_lastname = '';
  String get login_lastname => _login_lastname;

  String _login_phonenumber = '';
  String get login_phonenumber => _login_phonenumber;

  String _login_last_login = '';
  String get login_last_login => _login_last_login;

  String _login_profile_image = '';
  String get login_profile_image => _login_profile_image;

  String _login_thumb_profile_url = '';
  String get login_thumb_profile_url => _login_thumb_profile_url;

  int _login_code = 400;
  int get login_code => _login_code;

  String _login_response = 'You are not logged in';
  String get login_response => _login_response;

  void initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    _packageName = packageInfo.packageName;
    notifyListeners();
  }

  Future signInwithEmailPassword(userEmail, userPassword) async {
    _hasError = false;
    _login_response = 'Something went wrong';
    String encrypted__is_logged_in =
        xxtea.encryptToString('false', Config().epass);
    String encrypted_email = '';
    String encrypted_pass = '';
    String encrypted_token = '';
    String encrypted_uid = '';
    String encrypted_username = '';
    String encrypted_client_id = '';
    String encrypted_contact_id = '';
    String encrypted_firstname = '';
    String encrypted_lastname = '';
    String encrypted_phonenumber = '';
    String encrypted_last_login = '';
    String encrypted_profile_image = '';
    String encrypted_thumb_profile_url = '';
    String encrypted_login_code = xxtea.encryptToString('400', Config().epass);
    String encrypted_response =
        xxtea.encryptToString('Something went wrong', Config().epass);
    String encrypted_is_login = xxtea.encryptToString('false', Config().epass);
    final SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      var url = Config().current_protocol_domain + "/api/login";
      var data = {
        "email": userEmail,
        "password": userPassword,
      };

      bool is_error = false;
      dynamic res_obj;
      try {
        var res = await http.post(url, body: data);
        res_obj = jsonDecode(res.body);
      } on FormatException catch (e) {
        is_error = true;
        _hasError = true;
      } catch (_) {
        is_error = true;
        _hasError = true;
      }

      if (is_error == true) {
        _hasError = true;
        _login_response = 'Something went wrong';
        encrypted_login_code = xxtea.encryptToString('500', Config().epass);
        encrypted__is_logged_in =
            xxtea.encryptToString('false', Config().epass);
        encrypted_response =
            xxtea.encryptToString('Something went wrong', Config().epass);
      } else if (res_obj['status'] == 0) {
        _hasError = true;
        _login_response = res_obj['data'];
        encrypted_login_code = xxtea.encryptToString('400', Config().epass);
        encrypted__is_logged_in =
            xxtea.encryptToString('false', Config().epass);
        encrypted_response =
            xxtea.encryptToString(res_obj['data'], Config().epass);
      } else {
        encrypted_email =
            xxtea.encryptToString(res_obj['data']['email'], Config().epass);
        encrypted_pass = xxtea.encryptToString(userPassword, Config().epass);
        encrypted_token =
            xxtea.encryptToString(res_obj['data']['token'], Config().epass);
        encrypted_uid = xxtea.encryptToString(res_obj['uid'], Config().epass);
        encrypted_username =
            xxtea.encryptToString(res_obj['data']['username'], Config().epass);
        encrypted_client_id =
            xxtea.encryptToString(res_obj['data']['client_id'], Config().epass);
        encrypted_contact_id = xxtea.encryptToString(
            res_obj['data']['contact_id'], Config().epass);
        encrypted_firstname =
            xxtea.encryptToString(res_obj['data']['firstname'], Config().epass);
        encrypted_lastname =
            xxtea.encryptToString(res_obj['data']['lastname'], Config().epass);
        encrypted_phonenumber = xxtea.encryptToString(
            res_obj['data']['phonenumber'], Config().epass);
        encrypted_last_login = xxtea.encryptToString(
            res_obj['data']['last_login'], Config().epass);
        encrypted_profile_image = xxtea.encryptToString(
            res_obj['data']['profile_image'], Config().epass);
        encrypted_thumb_profile_url = xxtea.encryptToString(
            res_obj['data']['thumb_profile_url'], Config().epass);

        if (res_obj['code'] == 200) {
          encrypted_login_code = xxtea.encryptToString('200', Config().epass);
          encrypted_is_login = xxtea.encryptToString('true', Config().epass);
          encrypted_response = xxtea.encryptToString(
              'You are logged in successfully!', Config().epass);
          _loginCode = 200;
          _login_response = 'You are logged in successfully!';
        } else {
          encrypted_login_code = xxtea.encryptToString('204', Config().epass);
          encrypted_is_login = xxtea.encryptToString('false', Config().epass);
          _hasError = true;
          _login_response = 'Your account is not activated';
        }
      }
    } catch (e) {}
    await sp.setString('token', encrypted_token);
    await sp.setString('email', encrypted_email);
    await sp.setString('pass', encrypted_pass);
    await sp.setString('uid', encrypted_uid);
    await sp.setString('username', encrypted_username);
    await sp.setString('client_id', encrypted_client_id);
    await sp.setString('contact_id', encrypted_contact_id);
    await sp.setString('firstname', encrypted_firstname);
    await sp.setString('lastname', encrypted_lastname);
    await sp.setString('phonenumber', encrypted_phonenumber);
    await sp.setString('last_login', encrypted_last_login);
    await sp.setString('profile_image', encrypted_profile_image);
    await sp.setString('thumb_profile_url', encrypted_thumb_profile_url);
    await sp.setString('login_code', encrypted_login_code);
    await sp.setString('is_login', encrypted_is_login);
    await sp.setString('response', encrypted_response);
    try {
      _is_logged_in = xxtea
                  .decryptToString(encrypted_is_login, Config().epass)
                  .toLowerCase() ==
              'true'
          ? true
          : false;
      _login_email = xxtea.decryptToString(encrypted_email, Config().epass);
      _login_pass = xxtea.decryptToString(encrypted_pass, Config().epass);
      _login_token = xxtea.decryptToString(encrypted_token, Config().epass);
      _login_uid = xxtea.decryptToString(encrypted_uid, Config().epass);
      _login_username =
          xxtea.decryptToString(encrypted_username, Config().epass);
      _login_client_id =
          xxtea.decryptToString(encrypted_client_id, Config().epass);
      _login_contact_id =
          xxtea.decryptToString(encrypted_contact_id, Config().epass);
      _login_firstname =
          xxtea.decryptToString(encrypted_firstname, Config().epass);
      _login_lastname =
          xxtea.decryptToString(encrypted_lastname, Config().epass);
      _login_phonenumber =
          xxtea.decryptToString(encrypted_phonenumber, Config().epass);
      _login_last_login =
          xxtea.decryptToString(encrypted_last_login, Config().epass);
      _login_profile_image =
          xxtea.decryptToString(encrypted_profile_image, Config().epass);
      _login_thumb_profile_url =
          xxtea.decryptToString(encrypted_thumb_profile_url, Config().epass);
      _login_code = int.parse(
          xxtea.decryptToString(encrypted_login_code, Config().epass));
      _login_response =
          xxtea.decryptToString(encrypted_response, Config().epass);
    } catch (e) {
      _is_logged_in = false;
      _login_email = xxtea.decryptToString(encrypted_email, Config().epass);
      _login_pass = '';
      _login_token = '';
      _login_uid = '';
      _login_username = '';
      _login_client_id = '';
      _login_contact_id = '';
      _login_firstname = '';
      _login_lastname = '';
      _login_phonenumber = '';
      _login_last_login = '';
      _login_profile_image = '';
      _login_thumb_profile_url = '';
      _login_code = 400;
      _login_response = 'You are not logged in';
    }
    checkSignIn();
    notifyListeners();
  }

  Future getTimestamp() async {
    DateTime now = DateTime.now();
    String _timestamp = DateFormat('yyyyMMddHHmmss').format(now);
    timestamp = _timestamp;
  }

  Future checkSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _hasError = false;
    try {
      _is_logged_in = xxtea
                  .decryptToString(sp.getString('is_login'), Config().epass)
                  .toLowerCase() ==
              'true'
          ? true
          : false;
      _login_email =
          xxtea.decryptToString(sp.getString('email'), Config().epass);
      _login_pass = xxtea.decryptToString(sp.getString('pass'), Config().epass);
      _login_token =
          xxtea.decryptToString(sp.getString('token'), Config().epass);
      _login_uid = xxtea.decryptToString(sp.getString('uid'), Config().epass);
      _login_username =
          xxtea.decryptToString(sp.getString('username'), Config().epass);
      _login_client_id =
          xxtea.decryptToString(sp.getString('client_id'), Config().epass);
      _login_contact_id =
          xxtea.decryptToString(sp.getString('contact_id'), Config().epass);
      _login_firstname =
          xxtea.decryptToString(sp.getString('firstname'), Config().epass);
      _login_lastname =
          xxtea.decryptToString(sp.getString('lastname'), Config().epass);
      _login_phonenumber =
          xxtea.decryptToString(sp.getString('phonenumber'), Config().epass);
      _login_last_login =
          xxtea.decryptToString(sp.getString('last_login'), Config().epass);
      _login_profile_image =
          xxtea.decryptToString(sp.getString('profile_image'), Config().epass);
      _login_thumb_profile_url = xxtea.decryptToString(
          sp.getString('thumb_profile_url'), Config().epass);

      _login_code = int.parse(
          xxtea.decryptToString(sp.getString('login_code'), Config().epass));
      _login_response =
          xxtea.decryptToString(sp.getString('response'), Config().epass);
    } catch (e) {
      _is_logged_in = false;
      _login_email = '';
      _login_pass = '';
      _login_token = '';
      _login_uid = '';
      _login_username = '';
      _login_client_id = '';
      _login_contact_id = '';
      _login_firstname = '';
      _login_lastname = '';
      _login_phonenumber = '';
      _login_last_login = '';
      _login_profile_image = '';
      _login_thumb_profile_url = '';
      _login_code = 400;
      _login_response = 'You are not logged in';
    }

    notifyListeners();
  }

  Future refreshLogin() async {
    if (_is_logged_in == true) {
      signInwithEmailPassword(_login_email, _login_pass);
    }
    notifyListeners();
  }

  Future userSignout() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    _is_logged_in = false;
    _login_email = '';
    _login_token = '';
    _login_uid = '';
    _login_username = '';
    _login_client_id = '';
    _login_contact_id = '';
    _login_firstname = '';
    _login_lastname = '';
    _login_phonenumber = '';
    _login_last_login = '';
    _login_profile_image = '';
    _login_thumb_profile_url = '';
    _login_code = 400;
    _login_response = 'You are not logged in';
    // checkSignIn();
    notifyListeners();
  }

  Future clearAllData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
