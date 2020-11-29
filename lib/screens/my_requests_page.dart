import 'package:flutter/material.dart';
import 'package:Yalla7agz/shared/painted_line.dart';
import 'package:Yalla7agz/models/courts.dart';

class myRequests extends StatelessWidget {
  final List<Courts> items=[Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM")
    ,Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),
    Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),
    Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM")];
  final List<String> response=["Pending","Cancelled","Approved"];
  final List<Color> responseColor=[Colors.blueAccent,Colors.black,Colors.lightGreenAccent];
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return  Container(
      width: _width*0.87,
      margin: EdgeInsets.only(top: _height*0.04,bottom: _height*0.03),
      child: Column(
        children: <Widget>[
      new Container(
      alignment: Alignment.centerLeft,
        child: Text("My Requests",
          style: TextStyle(
              fontSize: 25,
              color: Color(0xFF71A411),
              fontWeight: FontWeight.bold
          ),),
      ),
      SizedBox(height: _height*0.025,),
      CustomPaint(
        size: Size(_width*0.87, _height*0.006),
        painter: CurvePainter(Color(0xFF71A411),Color(0x2671A411),3),
      ),
          new Flexible(

              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return requestsList(
                          place: "${items[index].getPlace()}",
                          time: "${items[index].getFrom()}"+" - "+"${items[index].getTo()}",
                          response: Text("${response[index%3]}",style: TextStyle(
                            color: responseColor[index%3],
                          ),),
                    );}
              ))
      ])
    );
  }
}
class requestsList extends StatelessWidget {
   requestsList({
    this.place,
    this.time,
    this.response,
  });

  final String place;
  final String time;
  final Widget response;

  @override
  Widget build(BuildContext context) {
    return Column(children: [

    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text(place),
          ),
          Expanded(
            flex: 4,
            child: Text(time)
            ),
          Expanded(
            flex: 2,
            child: response,
          )
        ],
      ),

      ),
      new Divider(
        color: Colors.black12,
        thickness: 1,
      )
    ],);
  }
}