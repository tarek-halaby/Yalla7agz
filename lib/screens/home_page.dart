import 'package:flutter/material.dart';
import 'package:Yalla7agz/models/courts.dart';
import 'package:Yalla7agz/shared/painted_line.dart';

class homePage extends StatelessWidget {
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
            child: Text("Home",
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
            height: _height*0.15,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/court.jpg'),
                fit: BoxFit.fill,
              ),
          )),
          SizedBox(height: _height*0.015,),

          new Container(
            alignment: Alignment.centerLeft,
            child: Text("Available Courts Around",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: _height*0.01,),

          new Container(
            alignment: Alignment.centerLeft,
            child: Text("Your location is Nasr City,Cairo,Egypt",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
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
                return availableCourtsList(place: "${items[index].getPlace()}",time: "${items[index].getFrom()}"+" - "+"${items[index].getTo()}",height: _height*0.08,);}
            )),
          new Divider(
            color: Colors.black12,
            thickness: _height*0.002,
          ),
         new Container(
           alignment: Alignment.centerRight,
           child: ButtonTheme(
               minWidth: _width*0.35,
               child:RaisedButton(

            onPressed: () {

            },
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(5.0),
                side: BorderSide(
                    color: Color(0xFF71A411))),
            color: Color(0xFF71A411),
            child: Text(
              "Show more",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ))
         )
        ],
      ),
    );
  }
}

class availableCourtsList extends StatelessWidget {
  availableCourtsList({
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
              flex: 5,
              child: Text(place),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
                flex: 4,
                child: Text(time)
            ),


          ],
        ))),
      ));
  }
}