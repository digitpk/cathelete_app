// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cathelete/models/article.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cathelete/config/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchBloc with ChangeNotifier {
  SearchBloc() {
    getRecentSearchList();
  }

  List<String> _recentSearchData = [];
  List<String> get recentSearchData => _recentSearchData;

  String _searchText = '';
  String get searchText => _searchText;

  bool _searchStarted = false;
  bool get searchStarted => _searchStarted;

  dynamic _articles = {'status': 'init'};
  List _articles_list = [];
  int _offset = 0;
  int _total_fetch_news = 0;
  int _total_available_news = 0;
  int _fetch_able_news = 0;
  int _last_news_featched_time = 0;
  bool _article_loading_state = false;
  String _search = '';
  String _token = '';

  dynamic get articles => _articles;
  int get offset => _offset;
  int get total_fetch_news => _total_fetch_news;
  int get total_available_news => _total_available_news;
  int get fetch_able_news => _fetch_able_news;
  int get last_news_featched_time => _last_news_featched_time;
  bool get article_loading_state => _article_loading_state;
  String get search => _search;

  TextEditingController _textFieldCtrl = TextEditingController();
  TextEditingController get textfieldCtrl => _textFieldCtrl;
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getRecentSearchList() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _recentSearchData = sp.getStringList('recent_search_data') ?? [];
    notifyListeners();
  }

  Future addToSearchList(String value) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _recentSearchData.remove(value);
    _recentSearchData.insert(0, value);
    await sp.setStringList('recent_search_data', _recentSearchData);
    notifyListeners();
  }

  Future removeFromSearchList(String value) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _recentSearchData.remove(value);
    await sp.setStringList('recent_search_data', _recentSearchData);
    notifyListeners();
  }

  // Future<List> getData() async {
  //   List<Article> data = [];
  //   QuerySnapshot rawData = await firestore
  //       .collection('contents')
  //       .orderBy('timestamp', descending: true)
  //       .get();
  //
  //   List<DocumentSnapshot> _snap = [];
  //   _snap.addAll(rawData.docs.where((u) => (u['title']
  //           .toLowerCase()
  //           .contains(_searchText.toLowerCase()) ||
  //       u['category'].toLowerCase().contains(_searchText.toLowerCase()) ||
  //       u['description'].toLowerCase().contains(_searchText.toLowerCase()))));
  //   data = _snap.map((e) => Article.fromFirestore(e)).toList();
  //   return data;
  // }

  changeArticleLoadingState(bool state_type) {
    _article_loading_state = state_type;
    notifyListeners();
  }

  newSearch(String search) {
    changeArticleLoadingState(false);
    _search = search;
    _articles = {'status': 'running'};
    _articles_list = [];
    _offset = 0;
    _total_fetch_news = 0;
    _total_available_news = 0;
    _fetch_able_news = 0;
    _last_news_featched_time = 0;
    _article_loading_state = false;
    notifyListeners();
    SearchArticles('', '');
  }

  SearchArticles(String search, String token) async {
    if (token != '') {
      _token = token;
    }
    print('token : ' + _token);
    if (search != '') {
      changeArticleLoadingState(true);
      newSearch(search);
    } else if (!(_total_fetch_news > 0 && _fetch_able_news == 0)) {
      if (_article_loading_state == false) {
        changeArticleLoadingState(true);
        print("Article loading start");
        var url = Config().current_protocol_domain +
            "/api/news_storage/search_news/index.php?query=" +
            _search +
            "&language=english&offset=" +
            offset.toString() +
            "&rows=10&api_key=" +
            _token;
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
          _fetch_able_news = 0;
          _articles = {'status': false, 'data': res_obj['data'], 'code': 404};
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
          _fetch_able_news = total_available_news - total_fetch_news;
          _last_news_featched_time = _articles['data']['news']
              [_articles['data']['news'].length - 1]['publish_time_sec'];
        }

        changeArticleLoadingState(false);
        notifyListeners();
      } else {
        print("New Article already loading");
      }
    } else {
      print("All article loaded");
    }
  }

  setSearchText(value) {
    _textFieldCtrl.text = value;
    _searchText = value;
    _searchStarted = true;
    notifyListeners();
  }

  saerchInitialize() {
    _articles = {'status': 'init'};
    _articles_list = [];
    _offset = 0;
    _total_fetch_news = 0;
    _total_available_news = 0;
    _fetch_able_news = 0;
    _last_news_featched_time = 0;
    _article_loading_state = false;
    _search = '';
    _token = '';
    _textFieldCtrl.text = '';
    notifyListeners();
  }
}
