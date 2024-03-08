import 'package:calenderapp/App/Screens/models/drawer_tile_model.dart';
import 'package:calenderapp/App/Screens/models/event_model.dart';
import 'package:calenderapp/App/Screens/models/home_page_model.dart';
import 'package:calenderapp/App/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../models/userprofile_item_model.dart';

/// A provider class for the HomePageScreen.
///
/// This provider manages the state of the HomePageScreen, including the
/// current homePageModelObj

// ignore_for_file: must_be_immutable
class HomePageProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  // String _pickedDate = DateTime.now().toIso8601String();
  // String get pickedDate => _pickedDate;

  // void selectDate({required String selectedDate}) {
  //   _pickedDate = selectedDate;
  //   notifyListeners();
  // }

String _startTime = DateTime.now().toIso8601String();
String get startTime => _startTime;
void getStartTime({required String time}){
  _startTime = time;
  notifyListeners();
}
String _endTime = DateTime.now().toIso8601String();
String get endTime => _endTime;
void getendTime({required String time}){
  _endTime = time;
  notifyListeners();
}
  HomePageModel homePageModelObj = HomePageModel();

  List<DateTime?>? selectedDatesFromCalendar1;
  bool _viewMoreText = false;
  int _selectedViewMoreText = -1;
  int get selectedViewMoreText => _selectedViewMoreText;
  getSelectedViewMoreText({required int index}) {
    _selectedViewMoreText = index;
    notifyListeners();
  }

  String _daySelectedDate = DateFormat.yMd().format(DateTime.now());
  String get daySelectedDate => _daySelectedDate;
  onDaySelected({required String date}) {
    _daySelectedDate = date;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  getSelectedDate({required DateTime date}) {
    _selectedDate = date;
    notifyListeners();
  }

  bool get viewMoreText => _viewMoreText;
  viewMore({required bool viewMore}) {
    _viewMoreText = viewMore;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _tileIndex = 2;
  int get tileIndex => _tileIndex;
  getSelectedTileIndex({required int index}) {
    _tileIndex = index;
    notifyListeners();
  }

  List<Category> categoryList = <Category>[
    Category(
        title: 'Brainstrom', innerColor: 0XFF735BF2, upperColor: 0XFF735BF2),
    Category(title: 'Desgin', innerColor: 0XFF00B383, upperColor: 0XFF00B383),
    Category(title: 'Workout', innerColor: 0XFF0095FF, upperColor: 0XFF0095FF)
  ];
  CalendarView _currentView = CalendarView.month;
  CalendarView get currentView => _currentView;
  getCalenderView(CalendarView view) {
    _currentView = view;
    notifyListeners();
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();
  String _categoryName = '';
  String get categoryName => _categoryName;

  getCategoryName(String name) {
    _categoryName = name;
    notifyListeners();
  }

  deleteSpecificEvent({required int id}) async {
    var data = await DBHelper.deleteSpecificData(id: id);
    print(data);
  }

  List<DrawerTileModel> drawerTileList = <DrawerTileModel>[
    DrawerTileModel(icon: 'assets/images/Frame 1.png', title: 'Day'),
    DrawerTileModel(icon: 'assets/images/week.png', title: 'Week'),
    DrawerTileModel(icon: 'assets/images/Group 36.png', title: 'Month'),
    DrawerTileModel(icon: 'assets/images/calendar.png', title: 'Event'),
  ];
  Future<int> addEvent({required EventModel event}) async {
    return await DBHelper.insert(event);
  }

  final List<EventModel> _events = <EventModel>[];
  List<EventModel> get events => _events;
  void getEvents() async {
    _events.clear();
    List<Map<String, dynamic>> allEvent = await DBHelper.queryData();
    _events.addAll(allEvent.map((e) => EventModel.fromJson(e)));
    print(events.length);
    notifyListeners();
  }
}

class Category {
  final String title;
  final int upperColor;
  final int innerColor;
  Category(
      {required this.title,
      required this.innerColor,
      required this.upperColor});
}
