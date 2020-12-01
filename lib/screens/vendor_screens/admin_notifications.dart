import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/shared/painted_line.dart';

class adminNotifications extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return new WillPopScope(
        onWillPop: () async {
          return false;
        },
        child:Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: Container(
              ),
              title:  Center(
                  child: Text("Yalla 7agz",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25))),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )]
          ),
          body: Container(
              margin: EdgeInsets.only(top: _height*0.04,bottom: _height*0.03,left: _width*0.07,right: _width*0.07),
              child: Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Notifications",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF71A411),
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    SizedBox(height: _height*0.025,),
                    CustomPaint(
                      size: Size(_width*0.87, _height*0.006),
                      painter: CurvePainter(Color(0xFF71A411),Color(0x2671A411),2),
                    ),
                    SizedBox(height: _height*0.015,),
                  ])),
        ));
  }

}
