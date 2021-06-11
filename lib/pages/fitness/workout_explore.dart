import 'package:carousel_pro/carousel_pro.dart';
import 'package:cathelete/constant/constants.dart';
import 'package:cathelete/pages/fitness/screens.dart';
import 'package:cathelete/pages/fitness/workout_explore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cathelete/widgets/column_builder.dart';
import 'package:cathelete/config/config.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WorkOutExplore extends StatefulWidget {
  final String heroTag;
  dynamic data;

  WorkOutExplore({Key key, @required this.heroTag, @required this.data})
      : super(key: key);

  @override
  _WorkOutExploreState createState() => _WorkOutExploreState();
}

class _WorkOutExploreState extends State<WorkOutExplore> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          widget.data['title'],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          slider(),
          heightSpace,
          exercise(),
          heightSpace,
          video(context),
        ],
      ),
    );
  }

  slider() {
    return Container(
      //margin: EdgeInsets.all(fixPadding * 2.0),
      height: 200.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 5.0,
            color: lightGreyColor,
          ),
        ],
      ),
      child: Carousel(
        images: [
          InkWell(
            child: sliderItem(
                widget.data['thumbnail'], widget.data['title'], 'slider_1'),
          ),
        ],
        dotSize: 0,
        dotSpacing: 15.0,
        dotPosition: DotPosition.bottomRight,
        dotVerticalPadding: 5.0,
        dotHorizontalPadding: 5.0,
        dotColor: greyColor,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.transparent,
        borderRadius: false,
      ),
    );
  }

  sliderItem(image, title, heroTag) {
    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Hero(
            tag: heroTag,
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200.0,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  blackColor.withOpacity(0.0),
                  blackColor.withOpacity(0.3),
                  blackColor.withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(fixPadding),
                  child: Text(
                    title.toUpperCase(),
                    style: white16MediumTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  exercise() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: 4,
        itemBuilder: (context, index) {
          dynamic itemData = [
            {'title': 'Burn', 'data': widget.data['burn']},
            {'title': 'Set', 'data': widget.data['set']},
            {'title': 'Reps', 'data': widget.data['reps']},
            {'title': 'Rest', 'data': widget.data['rest']}
          ];
          final item = itemData[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80.0,
                    margin: EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
                    padding: EdgeInsets.only(
                      left: (45.0 + fixPadding),
                      right: fixPadding,
                    ),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 3.0,
                          spreadRadius: 3.0,
                          color: lightGreyColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  item['title'] + ' :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor),
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  item['data'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 2.0,
                        color: (index % 2 == 0)
                            ? Config().appColor
                            : Colors.red[800],
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.data['thumbnail']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              (index != itemData.length - 1)
                  ? Container(
                      width: 1.5,
                      height: 30.0,
                      color: (widget.data['status'] == 'completed')
                          ? Config().appColor
                          : greyColor.withOpacity(0.7),
                      margin: EdgeInsets.only(left: 43.5),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }

  video(BuildContext context) {
    return Container(
      child: Container(
        height: 300,
        child: InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(url: Uri.parse(widget.data['video'])),
          initialOptions: options,
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var uri = navigationAction.request.url;

            return NavigationActionPolicy.ALLOW;
          },
        ),
      ),
    );
  }
}
