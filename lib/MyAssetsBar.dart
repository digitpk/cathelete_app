import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Constants.dart';

const double _kHeight = 25;
enum OrderType { Ascending, Descending, None }

/*Utils*/
class MyAsset {
  double size;
  Color color;
  String title;

  // MyAsset(this.size, this.color, this.title);
  MyAsset({this.size, this.color, this.title});
}

// ignore: must_be_immutable
class MyAssetsBar extends StatelessWidget {
  final int pointer;
  double width;
  double height;
  double radius;
  List<MyAsset> assets;
  double assetsLimit;
  OrderType order;
  Color background = Colors.grey;

  MyAssetsBar(
      {this.width,
      this.height = _kHeight,
      this.radius,
      this.assets,
      this.assetsLimit,
      this.order,
      this.pointer,
      this.background})
      : assert(width != null);

  double _getValuesSum() {
    double sum = 0;
    assets.forEach((single) => sum += single.size);
    return sum;
  }

  void orderMyAssetsList() {
    switch (order) {
      case OrderType.Ascending:
        {
          //From the smallest to the largest
          assets.sort((a, b) {
            return a.size.compareTo(b.size);
          });
          break;
        }
      case OrderType.Descending:
        {
          //From largest to smallest
          assets.sort((a, b) {
            return b.size.compareTo(a.size);
          });
          break;
        }
      case OrderType.None:
      default:
        {
          break;
        }
    }
  }

  //single.size : assetsSum = x : width
  Widget _createSingle(MyAsset singleAsset) {
    return SizedBox(
      width: (singleAsset.size * width) / (assetsLimit ?? _getValuesSum()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(singleAsset.title,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: Constants.fontsFamily,
                  fontWeight: FontWeight.w700)),
          Container(
            color: singleAsset.color,
            height: height,
          )
        ],
      ),
    );
  }

  Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List());
    FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  Widget build(BuildContext context) {
    if (assetsLimit != null && assetsLimit < _getValuesSum()) {
      print("assetsSum < _getValuesSum() - Check your values!");
      return Container();
    }

    //Order assetsList
    orderMyAssetsList();

    final double rad = radius ?? (height / 2);
    int pointerWidth = pointer * 2;
    double leftposition;
    if (pointerWidth >= 100) {
      leftposition = width - 20;
    } else {
      leftposition = width * (pointerWidth / 100);
    }
    print("getpointer==$pointerWidth");

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(rad)),
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.transparent,
          // color: background,
        ),
        width: width,
        height: height + 30,
        // height: height + 30,
        child: Stack(
          children: [
            Row(
                children: assets
                    .map((singleAsset) => _createSingle(singleAsset))
                    .toList()),
            new Positioned(
              //constraints.biggest.height to get the height
              // * .05 to put the position top: 5%
              top: height + 7,
              left: leftposition,
              child: Icon(
                Icons.arrow_drop_up,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
