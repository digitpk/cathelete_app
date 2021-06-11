import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:cathelete/config/config.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        supportZoom: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
        databaseEnabled: true,
        domStorageEnabled: true,
        useWideViewPort: false,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  PullToRefreshController pullToRefreshController;
  ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  bool IsLoadError = false;
  int IsLoadErrorCode = 0;

  int _currentPage = 0;
  final _pageController = PageController();

  bool IsPageLoading = true;
  bool pageLoading = true;
  bool IsLoadingFirstTime = false;
  bool LoadingScreen = true;

  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () {},
        child: Scaffold(
          // backgroundColor: Config().appColor,
          // drawerScrimColor: Config().appColor,
          resizeToAvoidBottomInset: false,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[];
            },
            body: SafeArea(
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    InAppWebView(
                      key: webViewKey,
                      initialUrlRequest:
                          URLRequest(url: Uri.parse('https://cathelete.com')),
                      onWebViewCreated: (controller) {
                        webViewController = controller;
                      },
                      onLoadStart: (controller, url) {
                        print('ok');
                      },
                      androidOnPermissionRequest:
                          (controller, origin, resources) async {
                        return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT);
                      },
                      shouldOverrideUrlLoading:
                          (controller, navigationAction) async {
                        var uri = navigationAction.request.url;

                        return NavigationActionPolicy.ALLOW;
                      },
                      onLoadStop: (controller, url) async {},
                      onLoadError: (controller, url, code, message) {},
                      onProgressChanged: (controller, progress) {},
                      onUpdateVisitedHistory:
                          (controller, url, androidIsReload) {},
                      onConsoleMessage: (controller, consoleMessage) {
                        print(consoleMessage);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
