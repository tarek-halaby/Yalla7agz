import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:Yalla7agz/models/court.dart';
final List<String> response = ["Pending", "Cancelled", "Approved"];
final List<Color> responseColor = [
  Colors.blueAccent,
  Colors.black,
  Colors.green
];
class adminRequests extends StatelessWidget {
  final List<Courts> items = [
    Courts("Court 1", "7:00 PM", "8:00 PM"),
    Courts("Court 2", "7:00 PM", "8:00 PM"),
    Courts("Court 3", "7:00 PM", "8:00 PM"),
    Courts("Court 4", "7:00 PM", "8:00 PM"),
    Courts("Court 5", "7:00 PM", "8:00 PM"),
    Courts("Court 6", "7:00 PM", "8:00 PM"),
    Courts("Court 7", "12:00 PM", "8:00 PM"),
    Courts("Court 8", "7:00 PM", "8:00 PM"),
    Courts("Court 9", "7:00 PM", "8:00 PM"),
    Courts("Court 10", "7:00 PM", "8:00 PM"),
    Courts("Court 11", "7:00 PM", "8:00 PM"),
    Courts("Court 12", "7:00 PM", "8:00 PM")
  ];


  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
        width: _width * 0.87,
        margin: EdgeInsets.only(top: _height * 0.04, bottom: _height * 0.03),
        child: Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Requests",
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
            painter: CurvePainter(Color(0xFF71A411), Color(0x2671A411), 3),
          ),
          SizedBox(
            height: _height * 0.025,
          ),
          new Flexible(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return requestsList(
                      place: "${items[index].getPlace()}",
                      time: "${items[index].getFrom()}" +
                          " - " +
                          "${items[index].getTo()}",
                      index: index%3,
                    );
                  }))
        ]));
  }
}

class requestsList extends StatelessWidget {
  requestsList({
    this.place,
    this.time,
    this.index,
  });

  final String place;
  final String time;
  final int index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height*0.09;
    double spaceWidth = MediaQuery.of(context).size.height*0.01;

    return Column(
      children: [
        Container(
        height:height ,
        child:Card(
        child:InkWell(
          onTap: () {
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Center(
                      child: Text(
                        place,
                        style: TextStyle(fontSize: 13),
                      )),
                ),
                Expanded(
                    flex: 4,
                    child: Center(
                        child: Text(
                          time,
                          style: TextStyle(fontSize: 13),
                        ))),
                Expanded(
                  flex: 4,
                  child: Center(child: index%3==0?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          ClipOval(
                            child: Material(
                              color: Colors.green, // button color
                              child: InkWell(
                                splashColor: Colors.green[900], // inkwell color
                                child: SizedBox(width: height/2, height: height/2, child: Icon(Icons.check,color: Colors.white)),
                                onTap: () {
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: spaceWidth,),
                          ClipOval(
                            child: Material(
                              color: Colors.red, // button color
                              child: InkWell(
                                splashColor: Colors.red[900], // inkwell color
                                child: SizedBox(width: height/2, height: height/2, child: Icon(Icons.clear,color: Colors.white,)),
                                onTap: () {
                                },
                              ),
                            ),
                          ),
                        ],
                      ):Text(
                    "${response[index % 3]}",
                    style: TextStyle(
                      fontSize: 13,
                      color: responseColor[index % 3],
                      fontWeight: FontWeight.bold
                    ),
                  )),
                )
              ],
            ),
          ),
        )))
      ],
    );
  }
}
