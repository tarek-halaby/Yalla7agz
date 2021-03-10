import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/providers/requests.dart';
import 'package:Yalla7agz/screens/client_screens/booked.dart';
import 'package:Yalla7agz/screens/client_screens/notifications.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:provider/provider.dart';

class bookingStatefulWidget extends StatefulWidget {
  bookingStatefulWidget({Key key}) : super(key: key);

  @override
  booking createState() => booking();
}

class booking extends State<bookingStatefulWidget> {
  DateTime _date;
  TimeOfDay _fromtime;
  TimeOfDay _totime;
  String _dateText;
  String _fromtimeText;
  String _totimeText;

  @override
  Widget build(BuildContext context) {
    final Ids =
    ModalRoute.of(context).settings.arguments as List;
    Arena arena=Ids[0];
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Center(
              child: Text("Yalla 7agz",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/notification'
                  );
                },
              )]
        ),
        body: Center(
            child: Container(
                width: _width * 0.87,
                margin: EdgeInsets.only(
                    top: _height * 0.04, bottom: _height * 0.02),
                child: Column(children: <Widget>[
                  new Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Booking",
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
                    painter:
                    CurvePainter(Color(0xFF71A411), Color(0x2671A411), 3),
                  ),
                  SizedBox(
                    height: _height * 0.025,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          "Arena: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Center(
                            child: Text(
                              arena.name,
                              style: TextStyle(fontSize: 15),
                            )),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          "Court : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Center(
                            child: Text(
                              arena.courts[Ids[1]].number,
                              style: TextStyle(fontSize: 15),
                            )),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          "Date : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        height: _height * 0.045,
                        child: RaisedButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate:
                                _date == null ? DateTime.now() : _date,
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
                              ).then((value) =>
                                  setState(() {
                                    if (value != null) {
                                      _dateText = value
                                          .toIso8601String()
                                          .split('T')
                                          .first;
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
                                    height: _height * 0.045,
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
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          "From : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 8,
                        child: Container(
                            height: _height * 0.045,
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
                                  ).then((value) =>
                                      setState(() {
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
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: _height * 0.045,
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
                                      flex: 11,
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
                                ]))))
                  ]),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          "To : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 8,
                        child: Container(
                          height: _height * 0.045,
                          child:RaisedButton(
                            onPressed: (){
                              showTimePicker(
                                builder: (BuildContext context, Widget child) {
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
                                initialTime: _totime==null?TimeOfDay.now():_totime,
                              ).then((value) => setState(() {
                                if(value !=null) {
                                  _totimeText = MaterialLocalizations.of(context).formatTimeOfDay(value,alwaysUse24HourFormat: false);
                                  _totime=value;
                                }
                              }));

                            },
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(

                                borderRadius:
                                BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Color(0x4D71A411))),
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                              Expanded(
                              flex: 2,

                              child: Container(
                                height: _height*0.045,
                                child:Icon(Icons.access_time_outlined,color: Colors.white,),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF71A411),
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),

                                  color:Color(0xFF71A411),
                                ),
                                margin: EdgeInsets.all(0),
                              ),
                            ),
                            Expanded(
                                flex:11,
                                child:Container(child:Center(child:Text(

                                  _totime==null? "To": _totimeText,
                                  style: TextStyle(
                                    color: Color(0xFF71A411),
                                    fontSize: 15,
                                  ),

                                ),),)
                            ),])
                          )
                        ))
                  ]
                  ),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Text(
                          "Total Price: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Center(
                            child: Text(
                              arena.courts[Ids[1]].pricePerHour,
                              style: TextStyle(fontSize: 15),
                            )),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  new Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                  InkWell(
                      onTap: () async{
                        DialogBuilder(context).showLoadingIndicator('Loading');
                        await Provider.of<Requests>(context, listen: false)
                            .book(arena.id,arena.courts[Ids[1]].id,arena.courts[Ids[1]].pricePerHour,this._dateText,this._fromtimeText,this._totimeText).whenComplete(() async{
//                          await Provider.of<Requests>(context,listen: false).getArenas(true);                                        DialogBuilder(context).hideOpenDialog();
                          Navigator.pushNamed(
                              context,
                              '/booked');
                        }).catchError((error) {
                          var errorMessage = 'Adding Failed';
                          MessageBoxModal(context).showMessageBoxModal(errorMessage);
                        });

                      },

                      child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child:Center(
                            child: Text("Confirm Booking",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          ))

                  ),
                  new Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child:Center(
                            child: Text("Cancel",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red),),
                          ))

                  ),
                  new Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                ]))));
  }
}
