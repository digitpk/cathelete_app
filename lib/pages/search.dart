import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cathelete/blocs/search_bloc.dart';
import 'package:cathelete/blocs/sign_in_bloc.dart';
import 'package:cathelete/utils/empty.dart';
import 'package:cathelete/utils/loading_cards.dart';
import 'package:cathelete/utils/snacbar.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:math';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 0))
        .then((value) => context.read<SearchBloc>().saerchInitialize());
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => SearchClear());
  }

  void SearchClear() async {
    final SearchBloc shb = Provider.of<SearchBloc>(context, listen: false);
    shb.saerchInitialize();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder: (context, SearchBloc, child) => Scaffold(
        appBar: AppBar(
          title: _searchBar(),
        ),
        key: scaffoldKey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // suggestion text

              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 15, bottom: 5, right: 15),
                child: Text(
                  SearchBloc.articles['status'] == 'init'
                      ? 'recent searchs'
                      : 'we have found',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ).tr(),
              ),
              SearchBloc.articles['status'] == 'init'
                  ? SuggestionsUI()
                  : AfterSearchUI()
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: TextFormField(
        autofocus: true,
        controller: context.watch<SearchBloc>().textfieldCtrl,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "search news".tr(),
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).secondaryHeaderColor),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.close,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              context.read<SearchBloc>().saerchInitialize();
            },
          ),
        ),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) {
          if (value == '') {
            openSnacbar(scaffoldKey, 'Type something!');
          } else {
            final SignInBloc sb =
                Provider.of<SignInBloc>(context, listen: false);
            final SearchBloc shb =
                Provider.of<SearchBloc>(context, listen: false);
            shb.SearchArticles(value, sb.login_token);
            context.read<SearchBloc>().setSearchText(value);
            context.read<SearchBloc>().addToSearchList(value);
          }
        },
      ),
    );
  }
}

class SuggestionsUI extends StatelessWidget {
  const SuggestionsUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sb = context.watch<SearchBloc>();
    return Expanded(
      child: sb.recentSearchData.isEmpty
          ? EmptyPage(
              icon: Feather.search,
              message: 'search news'.tr(),
              message1: "search-description".tr(),
            )
          : ListView.separated(
              padding: EdgeInsets.all(15),
              itemCount: sb.recentSearchData.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: ListTile(
                    title: Text(
                      sb.recentSearchData[index],
                      style: TextStyle(fontSize: 17),
                    ),
                    leading: Icon(
                      CupertinoIcons.time_solid,
                      color: Colors.grey[400],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context
                            .read<SearchBloc>()
                            .removeFromSearchList(sb.recentSearchData[index]);
                      },
                    ),
                    onTap: () {
                      context
                          .read<SearchBloc>()
                          .setSearchText(sb.recentSearchData[index]);
                      sb.addToSearchList(sb.recentSearchData[index]);
                      final SignInBloc snb =
                          Provider.of<SignInBloc>(context, listen: false);
                      final SearchBloc shb =
                          Provider.of<SearchBloc>(context, listen: false);
                      shb.SearchArticles(
                          sb.recentSearchData[index], snb.login_token);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class AfterSearchUI extends StatelessWidget {
  AfterSearchUI({Key key}) : super(key: key);

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder: (context, SearchBloc, child) => Expanded(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              final SignInBloc sb =
                  Provider.of<SignInBloc>(context, listen: false);
              SearchBloc.SearchArticles('', sb.login_token);
            }
          },
          child: FutureBuilder(
            //future: context.watch<SearchBloc>().getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (SearchBloc.articles['status'] == 'running') {
                return ListView.separated(
                  padding: EdgeInsets.all(15),
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return LoadingCard(height: 120);
                  },
                );
              } else if (SearchBloc.articles['status'] != true) {
                return EmptyPage(
                  icon: Feather.clipboard,
                  message: SearchBloc.articles['data'],
                  message1: "try again",
                );
              } else {
                return ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemCount: SearchBloc.articles['news'].length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (SearchBloc.total_fetch_news == (index + 1)) {
                      return Column(children: [
                        LoadingCard(height: 120),
                        (SearchBloc.total_fetch_news > 0 &&
                                    SearchBloc.fetch_able_news != 0) ==
                                true
                            ? Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: LoadingCard(height: 200),
                              )
                            : Container(),
                      ]);
                    } else {
                      return LoadingCard(height: 120);
                    }
                    return LoadingCard(height: 120);
                  },
                );
              }
              return ListView.separated(
                padding: EdgeInsets.all(15),
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 15,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return LoadingCard(height: 120);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
