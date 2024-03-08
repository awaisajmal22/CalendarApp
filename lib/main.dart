
import 'package:calenderapp/App/Screens/home/home_page_screen/provider/home_page_provider.dart';
import 'package:calenderapp/App/Screens/splash/splash_screen.dart';
import 'package:calenderapp/App/services/db_helper.dart';
import 'package:calenderapp/App/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await DBHelper.initDb();
  await NotificationServices().initNotification();
 await MobileAds.instance.initialize();
tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> HomePageProvider())
    ],
    child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ),
    );
  }
}
