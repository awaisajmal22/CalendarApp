// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';



import 'package:calenderapp/App/Screens/home/home_page_screen/home_page_screen.dart';
import 'package:calenderapp/App/Screens/home/home_page_screen/provider/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: HomePageScreen(),
    ); 
    //const  Placeholder();
  }
}
class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SfCalendar(
                view: CalendarView.month,
                firstDayOfWeek: 6,
                // initialDisplayDate: DateTime.now(),
                // initialSelectedDate: DateTime.now(),
                dataSource: MeetingDateSource(getAppointment()),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

List<Appointment> getAppointment() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(Duration(hours: 2));
  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Checkup',
      color: Colors.red));
  return meetings;
}

class MeetingDateSource extends CalendarDataSource {
  MeetingDateSource(List<Appointment> source) {
    appointments = source;
  }
}
