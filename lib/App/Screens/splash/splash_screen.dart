import 'package:calenderapp/App/Screens/home/calender_screen.dart';
import 'package:calenderapp/App/Screens/onboarding/onboarding_screen.dart';
import 'package:calenderapp/App/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../ads/AppOpenAdManager.dart';
import '../../../ads/InterstitialAd.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();

  Future<void> getAdsData() async {
    AdmobHelper admobHelper = AdmobHelper();
    admobHelper.initialization();
    appOpenAdManager.loadAd();
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
       Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
          );
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getAdsData().then((value) {
    //   Future.delayed(const Duration(seconds: 2), () {
    //     if (AppOpenAdManager.isLoaded) {
    //       appOpenAdManager.showAdIfAvailable(context);
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
    //       );
    //     } else {
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
    //       );
    //     }
    //   });
    // });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Constant.splashImage),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
