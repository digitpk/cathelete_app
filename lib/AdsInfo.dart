import 'dart:io';

class AdsInfo {
  static String getAppId() {
    if (Platform.isIOS) {
      return '';
    } else if (Platform.isAndroid) {
      return '';
    }
    return "";
  }

  static String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return '';
    } else if (Platform.isAndroid) {
      return '';
    }
    return "";
  }

  static String getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return '';
    } else if (Platform.isAndroid) {
      return '';
    }
    return "";
  }

  static String getRewardBasedVideoAdUnitId() {
    if (Platform.isIOS) {
      return '';
    } else if (Platform.isAndroid) {
      return '';
    }
    return "";
  }
}
