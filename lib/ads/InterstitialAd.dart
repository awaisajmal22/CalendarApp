
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../App/utils/constant.dart';
import 'ads_callback.dart';
InterstitialAd? _interstitialAd;
String interCode = "";
String bannerCode = "";
String adsType = '';

class AdmobHelper {
  static bool isBannerLoaded = false;
  initialization() async {
    adsType = Constant.ADSKEY;

    if (adsType.contains("0")) {
      interCode = Constant.INTER_ADS;
      bannerCode = Constant.BANNER_ADS;
      createInterad();
    } else if (adsType.contains("2")) {
      // loadUnityIntAd();
    } else if (adsType.contains("1")) {
      // interCode = Constant.FBINTERS_ID;
      // bannerCode = Constant.FBBANNER_ID;
      // loadfbInterstitialAd();
    }
  }

  static BannerAd getBannerAd() {
    BannerAd bAd = BannerAd(
        size: AdSize.smartBanner,
        adUnitId: bannerCode,
        listener: BannerAdListener(
            onAdClosed: (Ad ad) {},
            onAdFailedToLoad: (Ad ad, LoadAdError error) {
              ad.dispose();
            },
            onAdLoaded: (Ad ad) {
              isBannerLoaded = true;
            },
            onAdOpened: (Ad ad) {}),
        request: const AdRequest());
    bAd.load();
    return bAd;
  }

  // create interstitial ads
  void createInterad() {
    InterstitialAd.load(
      adUnitId: interCode,
      request: const AdRequest(),
      adLoadCallback:
          InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
        _interstitialAd = ad;
      }, onAdFailedToLoad: (LoadAdError error) {
        _interstitialAd = null;
      }),
    );
  }

  void showInterad(BuildContext context) {
    if (adsType.contains("0")) {
      if (_interstitialAd == null) {
        createInterad();
        return;
      }
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (InterstitialAd ad) {
        print("ad onAdshowedFullscreen");
      }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print("ad Disposed");
        ad.dispose();
        createInterad();
        Provider.of<AdsCallBack>(context, listen: false).setDismiss();
      }, onAdFailedToShowFullScreenContent:
              (InterstitialAd ad, AdError aderror) {
        print('$ad OnAdFailed $aderror');
        ad.dispose();
        createInterad();
        Provider.of<AdsCallBack>(context, listen: false).setFailed();
      });
      _interstitialAd!.show();
    } else if (adsType.contains("2")) {
      // showIntAd();
    } else if (adsType.contains("1")) {
      // showFbInterstitialAd();
    }
  }

  // static Future<void> loadUnityIntAd() async {
  //   await UnityAds.load(
  //     placementId: Constant.UNITY_INTER_PLACEMENT_ID,
  //     onComplete: (placementId) => print('Load Complete $placementId'),
  //     onFailed: (placementId, error, message) =>
  //         print('Load Failed $placementId: $error $message'),
  //   );
  // }

  // static Future<void> showIntAd() async {
  //   UnityAds.showVideoAd(
  //       placementId: Constant.UNITY_INTER_PLACEMENT_ID,
  //       onStart: (placementId) => print('Video Ad $placementId started'),
  //       onClick: (placementId) => print('Video Ad $placementId click'),
  //       onSkipped: (placementId) => print('Video Ad $placementId skipped'),
  //       onComplete: (placementId) async {
  //         await loadUnityIntAd();
  //       },
  //       onFailed: (placementId, error, message) async {
  //         await loadUnityIntAd();
  //       });
  // }

  // static Widget showBannerUnity() {
  //   return UnityBannerAd(
  //     placementId: Constant.UNITY_BANNER_PLACEMENT_ID,
  //     onLoad: (placementId) {
  //       print('Banner loaded: $placementId');
  //       isBannerLoaded = true;
  //     },
  //     onClick: (placementId) => print('Banner clicked: $placementId'),
  //     onFailed: (placementId, error, message) =>
  //         print('Banner Ad $placementId failed: $error $message'),
  //   );
  // }

  // static Widget showFbBanner() {
  //   return FacebookBannerAd(
  //     placementId: bannerCode,
  //     bannerSize: fb.BannerSize.STANDARD,
  //     listener: (result, value) {
  //       print("Banner Ad: $result -->  $value");
  //     },
  //   );
  // }

  // bool _fbisInterstitialAdLoaded = false;
  // Future loadfbInterstitialAd() async {
  //   FacebookInterstitialAd.loadInterstitialAd(
  //     placementId: interCode,
  //     listener: (result, value) {
  //       if (result == InterstitialAdResult.LOADED) {
  //         _fbisInterstitialAdLoaded = true;
  //       }
  //       if (result == InterstitialAdResult.DISMISSED &&
  //           value["invalidated"] == true) {
  //         _fbisInterstitialAdLoaded = false;
  //         loadfbInterstitialAd();
  //       }
  //     },
  //   );
  // }

  // showFbInterstitialAd() {
  //   if (_fbisInterstitialAdLoaded == true) {
  //     FacebookInterstitialAd.showInterstitialAd();
  //   }
  // }
}
