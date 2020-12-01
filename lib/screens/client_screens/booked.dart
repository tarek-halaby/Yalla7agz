import 'package:Yalla7agz/screens/client_screens/notifications.dart';
import 'package:Yalla7agz/shared/painted_line.dart';
import 'package:flutter/material.dart';

class booked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: Container(
                child:IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                )
            ),
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
              )
            ]),
        body: Center(
            child: Container(
                width: _width * 0.87,
                margin: EdgeInsets.only(
                    top: _height * 0.04, bottom: _height * 0.02),
                child: Column(children: <Widget>[
                  new Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Successful",
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
                  Expanded(
                      child:RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "You have successfully requested to book a court in ",
                              style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                        TextSpan(
                          text: "\"wafaa wel amal,Nasr City\" ",
                              style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "from ",
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                        TextSpan(
                          text: "7:00 PM ",
                          style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "to ",
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                        TextSpan(
                          text: "8:00 PM ",
                          style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "on ",
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                        TextSpan(
                          text: "Wednesday, 18th December,2020 ",
                          style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "kindly note that this request is still and u will be notified when it is Approved as soon as possible ",
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                        TextSpan(
                          text: "Pending ",
                          style: TextStyle(color: Colors.blueAccent,fontSize: 15),
                        ),
                        TextSpan(
                          text: "and u will be notified when it is ",
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                        TextSpan(
                          text: "Approved ",
                          style: TextStyle(color: Colors.green,fontSize: 15),
                        ),
                        TextSpan(
                          text: "as soon as possible.",
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                      ]
                    ),
                  )),
                  Container(
                      height: _height * 0.07,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(5.0),
                            side: BorderSide(
                                color: Color(0xFF71A411))),
                        color: Color(0xFF71A411),
                        child: Text(
                          "Return to home",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )),
                ]))));
  }
}
