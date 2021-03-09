import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:Yalla7agz/controllers/notification_controller.dart';


class Notifications extends StatelessWidget{
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
                notificationController cont=new notificationController();
                cont.allSeen();
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

            new Flexible(

                child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return notificationsList(title: notifications[index].getTitle(),messege:notifications[index].getMessege(),seen:notifications[index].getSeen());
                      }
                ))
      ])),
    ));
  }

}
class notificationsList extends StatelessWidget {
  notificationsList({
    this.title,
    this.messege,
    this.seen,
  });

   String title;
   String messege;
   bool seen;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child:Column(children: [
        new Container(
          alignment: Alignment.centerLeft,
          child: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
        ),
        new Container(
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Text(messege,style: TextStyle(color: Colors.black,fontSize: 13),),
                ),
                Expanded(
                  flex: 1,
                  child: seen?Container():Center(child:CustomPaint(painter: seenPoint())),
                )
              ],
            ),


      ),
      new Divider(
        color: Colors.black12,
        thickness: 1,
      )
    ],));
  }
}
class seenPoint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    var points = [Offset(0,0)];
    canvas.drawPoints(PointMode.points, points, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}