import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/providers/arenas.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:Yalla7agz/models/court.dart';
import 'package:Yalla7agz/screens/client_screens/booking.dart';
import 'package:Yalla7agz/screens/client_screens/courtDetails.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  List<Arena> _arenas = new List<Arena>();
   int courts=0;
  _refreshArenas(BuildContext context) async {
    List<Widget> itemsList = new List<Widget>();

    await Provider.of<Arenas>(context, listen: false).getArenas(false);
    this._arenas = await Provider.of<Arenas>(context, listen: false).arenas;
    for (var i = 0; i < _arenas.length; i++) {
      await Provider.of<Arenas>(context, listen: false)
          .getCourts(this._arenas[i].id);
      courts+=this._arenas[i].courts.length;
    }
  }

  final List<String> calender = [
    ("7:00 PM : 8:00 PM"),
    ("7:00 PM : 8:00 PM"),
    ("7:00 PM : 8:00 PM"),
    ("7:00 PM : 8:00 PM"),
    ("7:00 PM : 8:00 PM"),
    ("7:00 PM : 8:00 PM"),
    ("7:00 PM : 8:00 PM"),
    ("7:00 PM : 8:00 PM"),
    ("7:00 PM : 8:00 PM"),
  ];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return FutureBuilder<Object>(
        future: _refreshArenas(context),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<Arenas>(
                  builder: (context, arenaData, child) => Container(
                      width: _width * 0.87,
                      margin: EdgeInsets.only(
                          top: _height * 0.04, bottom: _height * 0.02),
                      child: Column(children: <Widget>[
                        new Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Home",
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
                          painter: CurvePainter(
                              Color(0xFF71A411), Color(0x2671A411), 3),
                        ),
                        SizedBox(
                          height: _height * 0.015,
                        ),
                        searchBookingStatefulWidget(
                          height: _height,
                          width: _width,
                        ),
                        new Flexible(
                            child: ListView(children: [
                              for ( var i in _arenas ) for ( var j in i.courts ) bookNowList(
                                place:
                                "${i.country.name}",
                                courtN: "Court: ${j.number}",
                                arenaId:_arenas.indexWhere((arena) => arena.id == i.id),
                                courtId: _arenas[_arenas.indexWhere((arena) => arena.id == i.id)].courts.indexWhere((court) => court.id==j.id),
                                arena: _arenas[_arenas.indexWhere((arena) => arena.id == i.id)],
                              )
                      ],
                        )),
                        new Divider(
                          color: Colors.black12,
                          thickness: _height * 0.002,
                        ),
                      ])));
        });
  }
}

class searchBookingStatefulWidget extends StatefulWidget {
  double height;
  double width;

  searchBookingStatefulWidget({Key key, this.height, this.width})
      : super(key: key);

  @override
  searchBookingStatefulWidgetState createState() =>
      searchBookingStatefulWidgetState(height, width);
}

class searchBookingStatefulWidgetState
    extends State<searchBookingStatefulWidget> {
  double _height;
  double _width;

  searchBookingStatefulWidgetState(this._height, this._width);

  final _searchFormKey = GlobalKey<FormState>();
  DateTime _date;
  TimeOfDay _fromtime;
  TimeOfDay _totime;
  String _dateText;
  String _fromtimeText;
  String _totimeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          child: Form(
            key: _searchFormKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: _width,
                  height: _height * 0.055,
                  child: RaisedButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Color(0x4D71A411))),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: _height * 0.055,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF71A411),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFF71A411),
                              ),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                              flex: 11,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Your Location",
                                    style: TextStyle(
                                      color: Color(0xFF71A411),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      )),
                ),
                SizedBox(
                  height: _height * 0.015,
                ),
                Container(
                  width: _width,
                  height: _height * 0.055,
                  child: RaisedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: _date == null ? DateTime.now() : _date,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2022),
                          builder: (BuildContext context, Widget child) {
                            return Theme(
                              data: ThemeData.dark().copyWith(
                                colorScheme: ColorScheme.dark(
                                  primary: Color(0xFF71A411),
                                  onPrimary: Colors.white,
                                  surface: Color(0xFF71A411),
                                  onSurface: Colors.white,
                                ),
                              ),
                              child: child,
                            );
                          },
                        ).then((value) => setState(() {
                              if (value != null) {
                                _dateText =
                                    value.toIso8601String().split('T').first;
                                _date = value;
                              }
                            }));
                      },
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Color(0x4D71A411))),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: _height * 0.055,
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF71A411),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFF71A411),
                              ),
                              margin: EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                              flex: 11,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    _date == null ? "When" : _dateText,
                                    style: TextStyle(
                                      color: Color(0xFF71A411),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      )),
                ),
                SizedBox(
                  height: _height * 0.015,
                ),
                Container(
                    height: _height * 0.055,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: RaisedButton(
                              onPressed: () {
                                showTimePicker(
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark(
                                          primary: Colors.white,
                                          onPrimary: Colors.white,
                                          surface: Color(0xFF71A411),
                                          onSurface: Colors.white,
                                        ),
                                      ),
                                      child: child,
                                    );
                                  },
                                  context: context,
                                  initialTime: _fromtime == null
                                      ? TimeOfDay.now()
                                      : _fromtime,
                                ).then((value) => setState(() {
                                      if (value != null) {
                                        _fromtimeText =
                                            MaterialLocalizations.of(context)
                                                .formatTimeOfDay(value,
                                                    alwaysUse24HourFormat:
                                                        false);
                                        _fromtime = value;
                                      }
                                    }));
                              },
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Color(0x4D71A411))),
                              color: Colors.white,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      height: _height * 0.055,
                                      child: Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFF71A411),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color(0xFF71A411),
                                      ),
                                      margin: EdgeInsets.all(0),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            _fromtime == null
                                                ? "From"
                                                : _fromtimeText,
                                            style: TextStyle(
                                              color: Color(0xFF71A411),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 6,
                          child: RaisedButton(
                              onPressed: () {
                                showTimePicker(
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark(
                                          primary: Colors.white,
                                          onPrimary: Colors.white,
                                          surface: Color(0xFF71A411),
                                          onSurface: Colors.white,
                                        ),
                                      ),
                                      child: child,
                                    );
                                  },
                                  context: context,
                                  initialTime: _totime == null
                                      ? TimeOfDay.now()
                                      : _totime,
                                ).then((value) => setState(() {
                                      if (value != null) {
                                        _totimeText =
                                            MaterialLocalizations.of(context)
                                                .formatTimeOfDay(value,
                                                    alwaysUse24HourFormat:
                                                        false);
                                        _totime = value;
                                      }
                                    }));
                              },
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Color(0x4D71A411))),
                              color: Colors.white,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      height: _height * 0.055,
                                      child: Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFF71A411),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color(0xFF71A411),
                                      ),
                                      margin: EdgeInsets.all(0),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            _totime == null
                                                ? "To"
                                                : _totimeText,
                                            style: TextStyle(
                                              color: Color(0xFF71A411),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              )),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: _height * 0.03,
        ),
        new Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Available Courts",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: _height * 0.02,
        ),
        CustomPaint(
          size: Size(_width * 0.87, _height * 0.005),
          painter: CurvePainter(Colors.black, Colors.black12, 2),
        ),
      ],
    );
  }
}

class bookNowList extends StatelessWidget {
  bookNowList({
    this.place,
    this.courtN,
    this.arenaId,
    this.courtId,
    this.arena,
  });

  final Arena arena;
  final String place;
  final int courtId;
  final int arenaId;
  final String courtN;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.08;

    return Container(
        child: Card(
      elevation: 1,
      child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/courtDetails',arguments: [
              arenaId,
              courtId
            ]);
          },
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Center(child: Text(place)),
                  ),
                  Expanded(flex: 4, child: Center(child: Text(courtN))),
                  Expanded(
                    flex: 2,
                    child: ClipOval(
                      child: Material(
                        color: Color(0x4071A411), // button color
                        child: InkWell(
                          splashColor: Color(0xFF71A411), // inkwell color
                          child: SizedBox(
                              width: height / 2,
                              height: height / 2,
                              child: Icon(
                                Icons.book_online,
                              )),
                          onTap: () {
                            Navigator.pushNamed(context, '/booking',arguments: [
                              arena,
                                courtId
                            ]);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    ));
  }
}
