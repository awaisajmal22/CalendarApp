import 'package:calenderapp/App/Screens/home/home_page_screen/models/home_page_model.dart';
import 'package:flutter/material.dart';

import '../models/userprofile_item_model.dart';

/// A provider class for the HomePageScreen.
///
/// This provider manages the state of the HomePageScreen, including the
/// current homePageModelObj

// ignore_for_file: must_be_immutable
class HomePageProvider extends ChangeNotifier {
  HomePageModel homePageModelObj = HomePageModel();

  List<DateTime?>? selectedDatesFromCalendar1;

  @override
  void dispose() {
    super.dispose();
  }
}
