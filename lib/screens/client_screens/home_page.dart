import 'file:///F:/grad/Yalla7agz/lib/screens/client_screens/courtDetails.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/models/courts.dart';
import 'package:Yalla7agz/shared/painted_line.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class homePage extends StatelessWidget {
  final List<Courts> items=[Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM")
    ,Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),
    Courts("wafaa wel amal,Nasr City","12:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),
    Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM"),Courts("wafaa wel amal,Nasr City","7:00 PM","8:00 PM")];
homePage(this.callBack);
  final Function callBack;
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

          locationStatefulWidget(),
          SizedBox(height: _height*0.02,),
          CustomPaint(
            size: Size(_width*0.87, _height*0.005),
            painter: CurvePainter(Colors.black,Colors.black12,2),
          ),
          new Flexible(

            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return availableCourtsList(place: "${items[index].getPlace()}",time: "${items[index].getFrom()}"+" - "+"${items[index].getTo()}",);}
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
              callBack();
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
  });

  final String place;
  final String time;

  @override
  Widget build(BuildContext context) {
      return Container(
        child:Card(

        elevation: 1,
        child: InkWell(
            onTap: (){
              Navigator.pushNamed(
                  context,
                  '/courtDetails');
            },
          child: Padding(
              padding: EdgeInsets.all(5),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Center(child:Text(place)),
            ),
            Expanded(
                flex: 5,
                child: Center(child:Text(time))
            ),


          ],
        ))),
      ));
  }
}
class locationStatefulWidget extends StatefulWidget {
  locationStatefulWidget({Key key}) : super(key: key);

  @override
  locationStatefulWidgetState createState() => locationStatefulWidgetState();
}
class locationStatefulWidgetState extends State<locationStatefulWidget> {
  @override
  Future<String> getLocationText() async {
    return getLocation();
  }
  Future<String> getLocation ()async
  {
    Geolocator.checkPermission().then((status) { print('status: $status'); });
    try {
      Position newPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(newPosition.latitude, newPosition.longitude);

      var first = placemarks.first;

       return "${first.country}, ${first.administrativeArea}, ${first.street}";


    } catch (e) {
      return "N/A";
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: getLocationText(),
    builder: (BuildContext context, AsyncSnapshot<String> text) {
      switch (text.connectionState) {
        case ConnectionState.waiting:
          return new Container(
            alignment: Alignment.centerLeft,
            child : Text("getting your location ..........",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),),
          );
        default:
          return new Container(
            alignment: Alignment.centerLeft,
            child : Text(text.data,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),),
          );
      }
  });
  }
}