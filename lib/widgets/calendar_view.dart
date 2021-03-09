import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

class CalendarView extends StatefulWidget {
  CalendarView({Key key}) : super(key: key);

  @override
  CalendarViewState createState() => CalendarViewState();
}

class CalendarViewState extends State<CalendarView> {
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height * 0.6,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DayView(
            date: DateTime.now(),
            style: DayViewStyle.fromDate(
              date: DateTime.now(),
              currentTimeCircleColor: Color(0xFF71A411),
              currentTimeRuleColor: Color(0xFF71A411),
            ),
            events: [
              FlutterWeekViewEvent(
                  title: 'Court 1',
                  description: 'null',
                  start: date.add(Duration(hours: 12)),
                  end: date.add(Duration(hours: 13)),
                  margin: EdgeInsets.only(right: 10, left: 10)),
            ],
          )),
    );
  }
}
