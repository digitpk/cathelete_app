import 'package:flutter/foundation.dart';
import 'package:cathelete/blocs/internet_bloc.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:cathelete/config/config.dart';
import 'dart:convert';
import 'package:cathelete/blocs/sign_in_bloc.dart';

class ShareBloc extends ChangeNotifier {
  int _share_code = 400;
  int get share_code => _share_code;

  int _share_toggle = -1;
  int get share_toggle => _share_toggle;

  String _share_response = 'Something went wrong';
  String get share_response => _share_response;

  dynamic _articles = {'status': 'init'};
  List _articles_list = [];
  int _offset = 0;
  int _total_fetch_news = 0;
  int _total_available_news = 0;
  int _last_news_featched_time = 0;
  bool _article_loading_state = false;
  bool _more_article_available = true;

  dynamic get articles => _articles;
  int get offset => _offset;
  int get total_fetch_news => _total_fetch_news;
  int get total_available_news => _total_available_news;
  int get last_news_featched_time => _last_news_featched_time;
  bool get article_loading_state => _article_loading_state;
  bool get more_article_available => _more_article_available;

  changeArticleLoadingState(bool state_type) {
    _article_loading_state = state_type;
    notifyListeners();
  }

  getArticles(String token, bool is_start) async {
    if (is_start == true) {
      _articles = {'status': 'init'};
      _articles_list = [];
      _offset = 0;
      _total_fetch_news = 0;
      _total_available_news = 0;
      _last_news_featched_time = 0;
      _article_loading_state = false;
      _more_article_available = true;
    }
    if (_more_article_available == false) {
      print('All article read');
    } else if (_article_loading_state == false) {
      changeArticleLoadingState(true);
      print("Article loading start");
      var url = Config().current_protocol_domain +
          "/api/news/news_share/get_share/index.php?offset=" +
          _offset.toString() +
          "&rows=10&api_key=" +
          token;
      print(url);
      bool is_error = false;
      dynamic res_obj;

      try {
        var res = await http.get(url);
        res_obj = jsonDecode(res.body);
      } on FormatException catch (e) {
        is_error = true;
      } catch (_) {
        is_error = true;
      }

      if (is_error == true) {
        _articles = {
          'status': false,
          'data': 'Something went wrong',
          'code': 400
        };
      } else if (res_obj['status'] == false && res_obj['code'] == 404) {
        if (_articles['status'] == 'init') {
          _articles = {'status': false, 'data': res_obj['data'], 'code': 404};
        } else {
          _more_article_available = false;
        }
      } else if (res_obj['status'] == false) {
        _articles = {'status': false, 'data': res_obj['data'], 'code': 400};
      } else {
        _articles_list.addAll(res_obj['data']['news']);
        _articles = {
          'status': true,
          'data': res_obj['data'],
          'news': _articles_list,
          'code': 200
        };
        if (offset == 0) {
          _total_available_news = _articles['data']['total_available_news'];
        }
        _offset = offset + _articles['data']['total_fetch_news'];
        _total_fetch_news =
            total_fetch_news + _articles['data']['total_fetch_news'];
        if (total_available_news - total_fetch_news > 0) {
          _more_article_available = true;
        } else {
          _more_article_available = false;
        }

        _last_news_featched_time = _articles['data']['news']
            [_articles['data']['news'].length - 1]['publish_time_sec'];
      }

      changeArticleLoadingState(false);
      notifyListeners();
    }
  }

  onShareIconClick(context, String news_url, String toggle) async {
    final InternetBloc ib = Provider.of<InternetBloc>(context, listen: false);
    final SignInBloc sb = Provider.of<SignInBloc>(context, listen: false);
    await ib.checkInternet();
    if (ib.hasInternet == false) {
      _share_code = 400;
      _share_response = 'No internet';
      return 0;
    }

    try {
      var url = Config().current_protocol_domain +
          "/api/news/news_share/toggle/index.php";
      var data = {
        "news_url": news_url,
        "api_key": sb.login_token,
        "toggle": toggle,
      };

      bool is_error = false;
      dynamic res_obj;
      try {
        var res = await http.post(url, body: data);
        res_obj = jsonDecode(res.body);
      } on FormatException catch (e) {
        is_error = true;
      } catch (_) {
        is_error = true;
      }
      print(res_obj);

      if (is_error == true) {
        _share_code = 500;
        _share_response = 'Something went wrong';
      } else if (res_obj['status'] == false) {
        _share_code = 400;
        _share_response = res_obj['data'];
      } else {
        if (res_obj['read_id'] != null) {
          _share_code = 200;
          _share_toggle = 1;
        } else {
          _share_code = 200;
          _share_toggle = 0;
        }
        _share_response = res_obj['data'];
      }
    } catch (e) {
      _share_code = 400;
      _share_response = 'Something went wrong';
    }
    notifyListeners();
  }
}
