import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/shared/painted_line.dart';

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
          title: Center(
            child: Text("Yalla 7agz",)
          ),
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

            new Flexible(

                child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      }
                ))
      ])),
    ));
  }

}
class notificationsList extends StatelessWidget {
  notificationsList({
    this.place,
    this.time,
    this.response,
  });

   String place;
   String time;
   Widget response;

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