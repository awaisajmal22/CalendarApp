import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:calenderapp/App/Screens/home/home_page_screen/widgets/day_calender.dart';
import 'package:calenderapp/App/Screens/home/home_page_screen/widgets/month_calender.dart';
import 'package:calenderapp/App/Screens/home/home_page_screen/widgets/shedule.dart';
import 'package:calenderapp/App/Screens/home/home_page_screen/widgets/week_calender.dart';
import 'package:calenderapp/App/Screens/models/event_model.dart';
import 'package:calenderapp/App/services/notification_services.dart';
import 'package:calenderapp/App/utils/navBar.dart';
import 'package:calenderapp/App/utils/app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'provider/home_page_provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomePageProvider>(context, listen: false).getEvents();
  }

  int randomColor = 1;

  generateRandomColor() {
    Random random = Random();
    int hex = 0xFF000000 + random.nextInt(0xFFFFFF);
    print(hex);
    setState(() {
      randomColor = hex;
    });
    // print(randomColor);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Consumer<HomePageProvider>(builder: (context, provider, __) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: Container(
            color: Colors.transparent,
            height: size.height * 0.08,
            width: size.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      generateRandomColor();
                      _showEventBottomSheet(
                        context,
                        provider.selectedDate,
                      );
                      // NotificationServices().showScheduleNotification(
                      //     id: 3,
                      //     title: 'hi',
                      //     payLoad: 'shedule Notification',
                      //     body: 'new',
                      //     scheduledNotificationDateTime: DateTime.now());
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff735BF2),
                        shape: BoxShape.circle,
                      ),
                      height: size.height * 0.08,
                      width: size.width * 0.120,
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          key: provider.key,
          drawer: customDrawer(context, provider: provider),
          appBar: customAppBar(size, provider, context),
          body: Column(
            children: [
              Expanded(
                child: Builder(builder: (_) {
                  if (provider.tileIndex == 0) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 100,
                      width: size.width * 100,
                      child: DayCalender(),
                    );
                  }
                  if (provider.tileIndex == 1) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 100,
                      width: size.width * 100,
                      child: WeekCalender(),
                    );
                  }
                  if (provider.tileIndex == 2) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 100,
                      width: size.width * 100,
                      child: MonthCalender(),
                    );
                    // return SizedBox(
                    //     width: MediaQuery.of(context).size.width,
                    //     child: Column(
                    //       children: [
                    //         _buildCalendar(context, provider),
                    //         // const SizedBox(height: 20),
                    //         Expanded(
                    //             // color: Colors.red,
                    //             // height: 458,
                    //             // width: double.maxFinite,
                    //             child: ListView.builder(
                    //                 padding: const EdgeInsets.all(0),
                    //                 itemCount: provider.events.length,
                    //                 itemBuilder: (context, index) {
                    //                   // print(
                    //                   //     "Date is ${DateFormat.d().format(DateTime.parse(provider.selectedDate))} ${provider.events[index].date}");
                    //                   if (provider.events[index].date
                    //                           .toString() ==
                    //                       provider.selectedDate) {
                    //                     return Container(
                    //                       margin: const EdgeInsets.all(10),
                    //                       // height: size.height * 0.12,
                    //                       padding: const EdgeInsets.all(10),
                    //                       width: double.infinity,
                    //                       decoration: BoxDecoration(
                    //                           color: Colors.white,
                    //                           boxShadow: [
                    //                             BoxShadow(
                    //                               color: const Color(0xff000000)
                    //                                   .withOpacity(0.0588),
                    //                               offset: const Offset(0, 3),
                    //                               spreadRadius: 0,
                    //                               blurRadius: 30,
                    //                             ),
                    //                           ],
                    //                           borderRadius:
                    //                               BorderRadius.circular(10)),
                    //                       child: Column(
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                         children: [
                    //                           Row(
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment
                    //                                     .spaceBetween,
                    //                             children: [
                    //                               Row(
                    //                                 mainAxisSize:
                    //                                     MainAxisSize.min,
                    //                                 children: [
                    //                                   Container(
                    //                                     alignment:
                    //                                         Alignment.center,
                    //                                     height: 10,
                    //                                     width: 10,
                    //                                     decoration:
                    //                                         BoxDecoration(
                    //                                       color: Colors.green,
                    //                                       shape:
                    //                                           BoxShape.circle,
                    //                                     ),
                    //                                     child: Container(
                    //                                       height: 5,
                    //                                       width: 5,
                    //                                       decoration:
                    //                                           BoxDecoration(
                    //                                               color: Colors
                    //                                                   .white,
                    //                                               shape: BoxShape
                    //                                                   .circle),
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width:
                    //                                         size.width * 0.020,
                    //                                   ),
                    //                                   Text(
                    //                                       "${provider.events[index].startTime.toString()}-${provider.events[index].endTime}")
                    //                                 ],
                    //                               ),
                    //                               GestureDetector(
                    //                                 onTap: () {
                    //                                   provider
                    //                                       .deleteSpecificEvent(
                    //                                           id: provider
                    //                                               .events[index]
                    //                                               .id!);
                    //                                   provider.getEvents();
                    //                                 },
                    //                                 child: Icon(
                    //                                     Icons.more_horiz,
                    //                                     color:
                    //                                         Color(0xff8F9BB3)),
                    //                               )
                    //                             ],
                    //                           ),
                    //                           SizedBox(
                    //                             height: size.height * 0.005,
                    //                           ),
                    //                           Text(
                    //                               "${provider.events[index].category} ${provider.events[index].eventName}"),
                    //                           SizedBox(
                    //                             height: size.height * 0.005,
                    //                           ),
                    //                           provider.viewMoreText == false
                    //                               ? Row(
                    //                                   children: [
                    //                                     SizedBox(
                    //                                       height: size.height *
                    //                                           0.02,
                    //                                       width:
                    //                                           size.width * 0.4,
                    //                                       child: Text(
                    //                                         provider
                    //                                             .events[index]
                    //                                             .eventDescription
                    //                                             .toString(),
                    //                                         overflow:
                    //                                             TextOverflow
                    //                                                 .ellipsis,
                    //                                       ),
                    //                                     ),
                    //                                     provider
                    //                                                 .events[
                    //                                                     index]
                    //                                                 .eventDescription!
                    //                                                 .length >
                    //                                             20
                    //                                         ? GestureDetector(
                    //                                             onTap: () {
                    //                                               provider.viewMore(
                    //                                                   viewMore:
                    //                                                       true);
                    //                                             },
                    //                                             child: const Text(
                    //                                                 'View more'),
                    //                                           )
                    //                                         : const SizedBox
                    //                                             .shrink()
                    //                                   ],
                    //                                 )
                    //                               : RichText(
                    //                                   text: TextSpan(children: [
                    //                                   TextSpan(
                    //                                       style:
                    //                                           const TextStyle(
                    //                                               color: Colors
                    //                                                   .black),
                    //                                       text: provider
                    //                                           .events[index]
                    //                                           .eventDescription!),
                    //                                   provider
                    //                                               .events[index]
                    //                                               .eventDescription!
                    //                                               .length >
                    //                                           20
                    //                                       ? TextSpan(
                    //                                           style: const TextStyle(
                    //                                               color: Colors
                    //                                                   .black),
                    //                                           text:
                    //                                               '. View less',
                    //                                           recognizer:
                    //                                               TapGestureRecognizer()
                    //                                                 ..onTap =
                    //                                                     () {
                    //                                                   provider.viewMore(
                    //                                                       viewMore:
                    //                                                           false);
                    //                                                 })
                    //                                       : const TextSpan()
                    //                                 ]))
                    //                         ],
                    //                       ),
                    //                     );
                    //                   } else
                    //                     return const SizedBox.shrink();
                    //                 })),
                    //       ],
                    //     ));
                  }
                  if (provider.tileIndex == 3) {
                    return Container(
                      color: Colors.white,
                      height: size.height * 100,
                      width: size.width * 100,
                      child: SheduleCalendar(),
                    );
                  } else {
                    return Container(
                      color: Colors.black,
                      height: size.height * 100,
                      width: size.width * 100,
                    );
                  }
                }),
              ),
            ],
          ),
          // body: SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   child: SingleChildScrollView(
          //     padding: const EdgeInsets.only(top: 7),
          //     child: Column(
          //       children: [
          //         _buildCalendar(context),
          //         const SizedBox(height: 20),
          //         const SizedBox(
          //           height: 458,
          //           width: double.maxFinite,
          //           child: Stack(
          //             alignment: Alignment.topCenter,
          //             children: [
          //               // _buildLineOne(context),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
        );
      }),
    );
  }

  Widget _buildCalendar(BuildContext context, HomePageProvider provider) {
    return SizedBox(
      height: 348,
      width: MediaQuery.of(context).size.width,
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.single,
          dayBuilder: (
              {required DateTime date,
              BoxDecoration? decoration,
              bool? isDisabled,
              bool? isSelected,
              bool? isToday,
              TextStyle? textStyle}) {
            return GestureDetector(
              onTap: () {
                // _showEventBottomSheet(context, date, provider);
                print(DateFormat.d().format(date));
                // provider.getSelectedDate(date: date.toIso8601String());
                provider.events.clear();
                provider.getEvents();
              },
              child: Container(
                decoration: decoration,
                child: Center(
                  child: Text(
                    DateFormat.d().format(date),
                    style: textStyle,
                  ),
                ),
              ),
            );
          },
          lastMonthIcon: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xFFCED3DE),
                  width: 1.0), // Add border here
              borderRadius:
                  BorderRadius.circular(8.0), // Add border radius here
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.arrow_back_ios, // You can use a different icon if needed
                color: Colors.black, // Change arrow color here
                size: 24.0, // Adjust icon size if needed
              ),
            ),
          ),
          modePickerTextHandler: ({required DateTime monthDate}) {
            final String monthText = DateFormat('MMMM').format(monthDate);
            final String yearText = DateFormat('yyyy').format(monthDate);

            return "$monthText\n$yearText";
          },
          nextMonthIcon: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xFFCED3DE),
                  width: 1.0), // Add border here
              borderRadius:
                  BorderRadius.circular(8.0), // Add border radius here
            ),
            child: Icon(
              Icons.arrow_forward_ios, // You can use a different icon if needed
              color: Colors.black, // Change arrow color here
              size: 24.0, // Adjust icon size if needed
            ),
          ),
          firstDate: DateTime(DateTime.now().year - 5),
          lastDate: DateTime(DateTime.now().year + 5),
          selectedDayHighlightColor: const Color(0XFF735BF2),
          centerAlignModePicker: true,
          firstDayOfWeek: 1,
          controlsHeight: 47.45,
          weekdayLabelTextStyle: const TextStyle(
            color: Color(0XFF8F9BB3),
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w400,
          ),
          selectedDayTextStyle: const TextStyle(
            color: Color(0XFFFFFFFF),
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w400,
          ),
          controlsTextStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w400,
          ),
          dayTextStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w400,
          ),
          disabledDayTextStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w400,
          ),
          weekdayLabels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
          dayBorderRadius: BorderRadius.circular(
            10,
          ),
        ),
        value: provider.selectedDatesFromCalendar1 ?? [],
        onValueChanged: (dates) {
          provider.selectedDatesFromCalendar1 = dates;
        },
      ),
    );
  }

  Future<void> _selectTime(BuildContext context,
      TextEditingController controller, HomePageProvider provider) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        controller.text = DateTime(
                provider.selectedDate.year,
                provider.selectedDate.month,
                provider.selectedDate.day,
                pickedTime.hour,
                pickedTime.minute)
            .toIso8601String();
      });
    }
  }

  bool isSwitched = false;
  int swtichToggle = 0;

  void _showEventBottomSheet(
    BuildContext context,
    DateTime selectedDate,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Consumer<HomePageProvider>(builder: (context, provider, __) {
              return Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add New Event',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto Flex',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 21),
                    TextField(
                      controller: provider.nameController,
                      decoration: InputDecoration(
                        labelText: 'Event Name',
                        hintText: 'Event Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      maxLines: 3,
                      controller: provider.descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Event Description',
                        hintText: 'Event Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2301),
                        );
                        if (pickedDate != null &&
                            pickedDate != provider.selectedDate) {
                          provider.getSelectedDate(date: pickedDate);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        // height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(16),

                          // onPressed: () => _selectDate(context, provider),
                        ),
                        child: Text(
                            DateFormat.yMd().format(provider.selectedDate)),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              print(provider.selectedDate.year);
                              print(pickedTime);
                              if (pickedTime != null) {
                                provider.getStartTime(
                                    time: DateTime(
                                            provider.selectedDate.year,
                                            provider.selectedDate.month,
                                            provider.selectedDate.day,
                                            pickedTime.hour,
                                            pickedTime.minute)
                                        .toIso8601String());
                              } else {
                                provider.getStartTime(
                                    time: DateTime(
                                            provider.selectedDate.year,
                                            provider.selectedDate.month,
                                            provider.selectedDate.day,
                                            provider.selectedDate.hour,
                                            provider.selectedDate.minute)
                                        .toIso8601String());
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat('h:mm a').format(
                                      DateTime.parse(provider.startTime))),
                                  Icon(Icons.access_time),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                provider.getendTime(
                                    time: DateTime(
                                            provider.selectedDate.year,
                                            provider.selectedDate.month,
                                            provider.selectedDate.day,
                                            pickedTime.hour,
                                            pickedTime.minute)
                                        .toIso8601String());
                              } else {
                                provider.getendTime(
                                    time: DateTime(
                                            provider.selectedDate.year,
                                            provider.selectedDate.month,
                                            provider.selectedDate.day,
                                            provider.selectedDate.hour,
                                            provider.selectedDate.minute)
                                        .add(const Duration(minutes: 1))
                                        .toIso8601String());
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat('h:mm a').format(
                                      DateTime.parse(provider.endTime))),
                                  Icon(Icons.access_time),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Select Category",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            provider.categoryList.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: GestureDetector(
                                onTap: () {
                                  provider.getCategoryName(
                                      provider.categoryList[index].title);
                                },
                                child: category(
                                    categoryname:
                                        provider.categoryList[index].title,
                                    context: context,
                                    colorcode:
                                        provider.categoryList[index].upperColor,
                                    circlecolor: provider
                                        .categoryList[index].innerColor),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        generateRandomColor();
                        provider.getendTime(
                            time: DateTime(
                                    provider.selectedDate.year,
                                    provider.selectedDate.month,
                                    provider.selectedDate.day,
                                    DateTime.parse(provider.endTime).hour,
                                    DateTime.parse(provider.endTime).minute)
                                .toIso8601String());
                        print(provider.selectedDate.hour);
                        provider.getStartTime(
                            time: DateTime(
                                    provider.selectedDate.year,
                                    provider.selectedDate.month,
                                    provider.selectedDate.day,
                                    DateTime.parse(provider.startTime).hour,
                                    DateTime.parse(provider.startTime).minute)
                                .toIso8601String());
                        // print(provider.descriptionController.text);
                        provider
                            .addEvent(
                                event: EventModel(
                                    color: randomColor,
                                    eventName: provider.nameController.text,
                                    eventDescription:
                                        provider.descriptionController.text,
                                    date: provider
                                        .selectedDate.microsecondsSinceEpoch,
                                    endTime: DateTime.parse(provider.endTime)
                                        .microsecondsSinceEpoch,
                                    startTime:
                                        DateTime.parse(provider.startTime)
                                            .microsecondsSinceEpoch,
                                    repeat: isSwitched == true ? 1 : 0,
                                    category: provider.categoryName))
                            .whenComplete(() {
                          provider.getEvents();

                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 371,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0XFF735BF2),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'Create Event',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto Flex',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
          },
        );
      },
    );
  }

  Widget category(
      {required String categoryname,
      required BuildContext context,
      required int colorcode,
      required int circlecolor}) {
    return Container(
      // width: 115,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(colorcode).withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 11,
            height: 11,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(circlecolor), // Outer border color
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(
                      3), // Adjust the margin to control the size of the inner circle
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .white, // Inner circle color (transparent for empty space)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text('$categoryname'),
        ],
      ),
    );
  }
}
