import 'package:Yalla7agz/widgets/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';

class adminCalendar extends StatelessWidget {
  final List<String> calendar = [
    "1:00 PM To 2:00 PM",
    "2:00 PM To 3:00 PM",
    "4:00 PM To 5:00 PM",
    "5:00 PM To 6:00 PM",
    "7:00 PM To 8:00 PM",
    "8:00 PM To 9:00 PM",
    "10:00 PM To 12:00 PM",
    "12:00 AM To 2:00 AM",
    "12:00 AM To 2:00 AM",
    "12:00 AM To 2:00 AM",
    "12:00 AM To 2:00 AM",
    "12:00 AM To 2:00 AM",
  ];
  final List<String> reservers = [
    "Ahmed",
    "Mohamed",
    "Mahomoud",
    "ziad",
    "Tarek",
    "Khaled",
    "Ahmed",
    "Mohamed",
    "Mahomoud",
    "ziad",
    "Tarek",
    "Khaled"
  ];
  final List<String> courts = [
    "Court 1",
    "Court 2",
    "Court 3",
    "Court 4",
    "Court 5",
    "Court 6",
    "Court 1",
    "Court 2",
    "Court 3",
    "Court 4",
    "Court 5",
    "Court 6",
  ];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
        width: _width * 0.87,
        margin: EdgeInsets.only(top: _height * 0.04, bottom: _height * 0.03),
        child: Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Today Calendar",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF71A411),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: _height * 0.025,
          ),
          CustomPaint(
            size: Size(_width * 0.87, _height * 0.006),
            painter: CurvePainter(Color(0xFF71A411), Color(0x2671A411), 2),
          ),
          SizedBox(
            height: _height * 0.025,
          ),
          CalendarView()
        ]));
  }
}