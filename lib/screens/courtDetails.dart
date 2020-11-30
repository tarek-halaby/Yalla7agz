import 'package:Yalla7agz/models/courts.dart';
import 'package:Yalla7agz/screens/notifications.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/shared/painted_line.dart';
import 'package:Yalla7agz/screens/booking.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class courtDetails extends StatelessWidget {
  final List<Courts> arena=[Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM")
    ,Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),
    Courts("wafaa wel amal,Nasr City","12:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),
    Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM")];
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
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
        child:Container(
        width: _width*0.87,
        margin: EdgeInsets.only(top: _height*0.04,bottom: _height*0.02),
        child: Column(
          children: <Widget>[
        new Container(
        alignment: Alignment.centerLeft,
          child: Text("Court Details",
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
            SizedBox(height: _height*0.025,),

            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Arena Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    ClipOval(
                      child: Material(
                        color: Colors.white, // button color
                        child: InkWell(
                          child: SizedBox(width: _height*0.05, height: _height*0.05, child: Icon(Icons.call,color: Colors.blueAccent,)),
                          onTap: () async{
                            await launch("tel://01158456325");
                          },
                        ),
                      ),
                    ),
                  ],
                )),
        SizedBox(height: _height*0.015,),
        new Container(
            height: _height*0.15,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/arena.jpg'),
                fit: BoxFit.fill,
              ),
            )),
        SizedBox(height: _height*0.015,),
            Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      child:Text("Address: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      child:Text("Nasr city, cairo, Egypt",style: TextStyle(fontSize: 15),) ,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ClipOval(
                      child: Material(
                        color: Color(0x4071A411), // button color
                        child: InkWell(
                          splashColor: Color(0xD171A411), // inkwell color
                          child: SizedBox(width: _height*0.05, height: _height*0.05, child: Icon(Icons.location_on,)),
                          onTap: () async{
                            final availableMaps = await MapLauncher.installedMaps;
                            await availableMaps.first.showMarker(
                              coords: Coords(30.169846, 31.490351),
                              title: "Ocean Beach",
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ] ),
            SizedBox(height: _height*0.015,),
            Row(
              children: <Widget>[
                Container(
                    child: Text("Courts: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                ),
              new Container(
              height: _height*0.055,
              width: _width*0.70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
              itemCount: arena.length,
              itemBuilder: (context, index) {
                return Card(
                child:InkWell(
                    onTap: (){},
                    child:Container(child:Center(child:Text("court "+index.toString(),style: TextStyle(fontSize: 15),),),
                width: _width*0.15,
                  height: _height*0.055,

                    )
                ));

              }))
              ],
            ),
            SizedBox(height: _height*0.025,),
            Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      child:Text("Court Number: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child:Center(child:Text("1",style: TextStyle(fontSize: 15),)) ,
                    ),
                  ),
                ] ),
            SizedBox(height: _height*0.025,),
            Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      child:Text("Court Type: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child:Center(child:Text("5 v 5",style: TextStyle(fontSize: 15),)) ,
                    ),
                  ),
                ] ),
            SizedBox(height: _height*0.025,),
            Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      child:Text("Price per hour: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child:Center(child:Text("150",style: TextStyle(fontSize: 15),)) ,
                    ),
                  ),
                ] ),
            new Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context,
                      '/booking');
                },

                child:Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child:Center(
                      child: Text("Book Now",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
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
        ])

      ),
    ));
  }

}