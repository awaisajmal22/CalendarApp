import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:calenderapp/App/utils/navBar.dart';
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
  HomePageScreenState createState() => HomePageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: const HomePageScreen(),
    );
  }
}

class HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          actions: [
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image.asset(
                  'assets/images/Icon.png', // Replace with your image asset path
                  color: Colors.black, // Change image color if needed
                  width: 24.0, // Adjust image size if needed
                  height: 24.0,
                )),
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 7),
            child: Column(
              children: [
                _buildCalendar(context),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 458,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // _buildLineOne(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 348,
          width: MediaQuery.of(context).size.width,
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              dayBuilder: (
                  {required DateTime date,
                  BoxDecoration? decoration,
                  bool? isDisabled,
                  bool? isSelected,
                  bool? isToday,
                  TextStyle? textStyle}) {
                return GestureDetector(
                  onTap: () {
                    _showEventBottomSheet(context, date);
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
                    Icons
                        .arrow_back_ios, // You can use a different icon if needed
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
                  Icons
                      .arrow_forward_ios, // You can use a different icon if needed
                  color: Colors.black, // Change arrow color here
                  size: 24.0, // Adjust icon size if needed
                ),
              ),
              calendarType: CalendarDatePicker2Type.single,
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
      },
    );
  }

  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2301),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _dateController.text =
            '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
      });
    }
  }

  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        controller.text = '${pickedTime.hour}:${pickedTime.minute}';
      });
    }
  }

  bool isSwitched = false;

  void _showEventBottomSheet(BuildContext context, DateTime selectedDate) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                    decoration: InputDecoration(
                      labelText: 'Event Name',
                      hintText: 'Event Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      labelText: 'Date',
                      hintText: 'Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _startDateController,
                          readOnly: true,
                          onTap: () =>
                              _selectTime(context, _startDateController),
                          decoration: InputDecoration(
                            labelText: 'Start Time',
                            hintText: 'Start Time',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.access_time),
                              onPressed: () =>
                                  _selectTime(context, _startDateController),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _endDateController,
                          readOnly: true,
                          onTap: () => _selectTime(context, _endDateController),
                          decoration: InputDecoration(
                            labelText: 'End Time',
                            hintText: 'End Time',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.access_time),
                              onPressed: () =>
                                  _selectTime(context, _endDateController),
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
                      children: [
                        category(
                            categoryname: 'Brainstorm',
                            context: context,
                            colorcode: 0XFF735BF2,
                            circlecolor: 0XFF735BF2),
                        const SizedBox(
                          width: 10,
                        ),
                        category(
                            categoryname: 'Brainstorm',
                            context: context,
                            colorcode: 0XFF00B383,
                            circlecolor: 0XFF00B383),
                        const SizedBox(
                          width: 10,
                        ),
                        category(
                            categoryname: 'Brainstorm',
                            context: context,
                            colorcode: 0XFF0095FF,
                            circlecolor: 0XFF0095FF),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                  )
                ],
              ),
            );
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
      width: 115,
      height: 44,
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
