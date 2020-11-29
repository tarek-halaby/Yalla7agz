import 'package:flutter/material.dart';
import 'package:Yalla7agz/shared/painted_line.dart';
import 'package:Yalla7agz/models/courts.dart';

class bookNowPage extends StatelessWidget {
  final List<Courts> items=[Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM")
    ,Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),
    Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),
    Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM")];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
        width: _width*0.87,
        margin: EdgeInsets.only(top: _height*0.04,bottom: _height*0.02),
      child: Column(
      children: <Widget>[
      new Container(
      alignment: Alignment.centerLeft,
      child: Text("Book Now",
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
      SizedBox(height: _height*0.015,),

        new Container(
          alignment: Alignment.centerLeft,
          child: Text("Available Courts",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),),
        ),
        SizedBox(height: _height*0.02,),
        CustomPaint(
          size: Size(_width*0.87, _height*0.005),
          painter: CurvePainter(Colors.black,Colors.black12,2),
        ),

        new Flexible(

            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return bookNowList(place: "${items[index].getPlace()}",time: "${items[index].getFrom()}"+" - "+"${items[index].getTo()}",height: _height*0.08,);}
            )),
        new Divider(
          color: Colors.black12,
          thickness: _height*0.002,
        ),
    ]));
  }
}
class bookNowList extends StatelessWidget {
  bookNowList({
    this.place,
    this.time,
    this.height,
  });

  final String place;
  final String time;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        child:Card(

          elevation: 1,
          child: Padding(
              padding: EdgeInsets.all(5),
              child: InkWell(
                  onTap: (){},
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        child: ClipOval(
                          child: Material(
                            color: Color(0x4071A411), // button color
                            child: InkWell(
                              splashColor: Color(0xFF71A411), // inkwell color
                              child: SizedBox(width: height/2, height: height/2, child: Icon(Icons.book_online,)),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),

                    ],
                  ))),
        ));
  }
}
