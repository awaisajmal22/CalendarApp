import 'package:calenderapp/App/Screens/home/home_page_screen/provider/home_page_provider.dart';
import 'package:calenderapp/App/Screens/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthCalender extends StatelessWidget {
  MonthCalender({super.key});
  // final CalendarController _controller = CalendarController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<HomePageProvider>(
      builder: (context, provider, __) {
        return SfCalendar(
            // controller: _controller,
            // onViewChanged: (view) {
            //   if (provider.tileIndex == 0) {
            //     provider.getCalenderView(CalendarView.day);
            //   } else if (provider.tileIndex == 1) {
            //     provider.getCalenderView(CalendarView.week);
            //   } else if (provider.tileIndex == 2) {
            //     provider.getCalenderView(CalendarView.month);
            //   }
            // },

            initialDisplayDate: DateTime.now(),
            onSelectionChanged: (date) {
              // print("Hi");
              provider.getSelectedDate(date: date.date!);
              // print('Selected date: ${date.date}');
            },
            onTap: (CalendarTapDetails details) {
              // print("ho hpw");
              if (details.targetElement == CalendarElement.calendarCell) {
                provider.getSelectedDate(date: details.date!);
              }
            },
            todayHighlightColor: Color(0xff735BF2),
            cellBorderColor: Colors.transparent,
            selectionDecoration: BoxDecoration(
                color: Color(0xff735BF2).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            view: CalendarView.month,
            dataSource:
                MeetingDataSource(_getDataSource(event: provider.events)),
            monthViewSettings: MonthViewSettings(
              showAgenda: true,
              agendaViewHeight: size.height * 0.4,
              appointmentDisplayCount: 5,
            ));
      },
    );
  }
}

List<EventModel> _getDataSource({required List<EventModel> event}) {
  final List<EventModel> meetings = <EventModel>[];

  meetings.addAll(event);
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<EventModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return DateTime.fromMicrosecondsSinceEpoch(appointments![index].startTime);
  }

  DateTime getDateTime(int index) {
    return DateTime.fromMicrosecondsSinceEpoch(appointments![index].date);
  }

  @override
  DateTime getEndTime(int index) {
    return DateTime.fromMicrosecondsSinceEpoch(appointments![index].endTime);
  }

  @override
  String getSubject(int index) {
    return "${appointments![index].category} ${appointments![index].eventName}";
  }

  @override
  Color getColor(int index) {
    return Color(appointments![index].color);
  }
}
