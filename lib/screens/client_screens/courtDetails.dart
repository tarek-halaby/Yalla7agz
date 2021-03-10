import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/models/court.dart';
import 'package:Yalla7agz/providers/arenas.dart';
import 'package:Yalla7agz/screens/client_screens/notifications.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:Yalla7agz/screens/client_screens/booking.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class courtDetails extends StatefulWidget {
  courtDetails({Key key}) : super(key: key);

  @override
  courtDetailsState createState() => courtDetailsState();
}
class courtDetailsState extends State<courtDetails> {
  List<Arena> _arenas = new List<Arena>();
  _refreshArenas(BuildContext context) async {
    List<Widget> itemsList = new List<Widget>();

    await Provider.of<Arenas>(context, listen: false).getArenas(false);
    this._arenas = await Provider.of<Arenas>(context, listen: false).arenas;
    for (var i = 0; i < _arenas.length; i++) {
      await Provider.of<Arenas>(context, listen: false)
          .getCourts(this._arenas[i].id);
    }
  }
  bool _rated;
  @override
  void initState(){
    _rated=false;
  }@override
  Widget build(BuildContext context) {
    final Ids =
    ModalRoute.of(context).settings.arguments as List;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return FutureBuilder<Object>(
        future: _refreshArenas(context),
    builder: (context, snapshot) {
      return snapshot.connectionState == ConnectionState.waiting
          ? Center(
        child: CircularProgressIndicator(),
      )
          : RefreshIndicator(
          onRefresh: () => _refreshArenas(context),
          child: Consumer<Arenas>(
              builder: (context, arenaData, child) =>
                  Scaffold(
                      appBar: AppBar(
                          centerTitle: true,
                          title: Center(
                              child: Text("Yalla 7agz",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25))),
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
                          ]
                      ),
                      body: SingleChildScrollView(child: Center(
                          child: Container(
                              width: _width * 0.87,
                              margin: EdgeInsets.only(
                                  top: _height * 0.04, bottom: _height * 0.02),
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

                                    SizedBox(height: _height * 0.025,),
                                    CustomPaint(
                                      size: Size(
                                          _width * 0.87, _height * 0.006),
                                      painter: CurvePainter(
                                          Color(0xFF71A411), Color(0x2671A411),
                                          2),
                                    ),
                                    SizedBox(height: _height * 0.025,),

                                    Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(arenaData.arenas[Ids[0]].name, style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),),
                                            ClipOval(
                                              child: Material(
                                                color: Colors.white,
                                                // button color
                                                child: InkWell(
                                                  child: SizedBox(
                                                      width: _height * 0.05,
                                                      height: _height * 0.05,
                                                      child: Icon(Icons.call,
                                                        color: Colors
                                                            .blueAccent,)),
                                                  onTap: () async {
                                                    await launch(
                                                        "tel://"+arenaData.arenas[Ids[0]].mobileNumber);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                    SizedBox(height: _height * 0.015,),

                                    new Container(
                                        height: _height * 0.15,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/arena.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                                    SizedBox(height: _height * 0.015,),
                                    Container(child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Text("Rating: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                              child: Text("3.5",
                                                style: TextStyle(
                                                    fontSize: 15),),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: ClipOval(
                                              child: Material(
                                                child: InkWell(
                                                  child: SizedBox(
                                                      width: _height * 0.05,
                                                      height: _height * 0.05,
                                                      child: Icon(
                                                        _rated
                                                            ? Icons.star
                                                            : Icons.star_border,
                                                        color: _rated ? Colors
                                                            .yellow : null,
                                                      )),
                                                  onTap: () {
                                                    setState(() {
                                                      _rated = !_rated;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ])),
                                    SizedBox(height: _height * 0.015,),
                                    Container(child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Text("Address: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                              child: Text(
                                                arenaData.arenas[Ids[0]].country.name+","+arenaData.arenas[Ids[0]].country.city.name,
                                                style: TextStyle(
                                                    fontSize: 15),),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: ClipOval(
                                              child: Material(
                                                color: Color(0x4071A411),
                                                // button color
                                                child: InkWell(
                                                  splashColor: Color(
                                                      0xD171A411),
                                                  // inkwell color
                                                  child: SizedBox(
                                                      width: _height * 0.05,
                                                      height: _height * 0.05,
                                                      child: Icon(
                                                        Icons.location_on,)),
                                                  onTap: () async {
                                                    final availableMaps = await MapLauncher
                                                        .installedMaps;
                                                    await availableMaps.first
                                                        .showMarker(
                                                      coords: Coords(
                                                       double.parse(arenaData.arenas[Ids[0]].country.city.region.address.long),double.parse(arenaData.arenas[Ids[0]].country.city.region.address.lat)),
                                                      title: "Ocean Beach",
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ]),),
                                    SizedBox(height: _height * 0.025,),
                                    Container(child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Text("Court Number: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 10,
                                            child: Container(
                                              child: Center(child: Text(arenaData.arenas[Ids[0]].courts[Ids[1]].number,
                                                style: TextStyle(
                                                    fontSize: 15),)),
                                            ),
                                          ),
                                        ])),
                                    SizedBox(height: _height * 0.025,),
                                    Container(child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Text("Court Type: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 10,
                                            child: Container(
                                              child: Center(child: Text(arenaData.arenas[Ids[0]].courts[Ids[1]].courtType.type,
                                                style: TextStyle(
                                                    fontSize: 15),)),
                                            ),
                                          ),
                                        ])),
                                    SizedBox(height: _height * 0.025,),
                                    Container(child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Text("Price per hour: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 10,
                                            child: Container(
                                              child: Center(child: Text(arenaData.arenas[Ids[0]].courts[Ids[1]].pricePerHour,
                                                style: TextStyle(
                                                    fontSize: 15),)),
                                            ),
                                          ),
                                        ])),
                                    new Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    Container(child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context,
                                              '/booking',arguments:[
                                            arenaData.arenas[Ids[0]],
                                            Ids[1]
                                          ] );
                                        },

                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            child: Center(
                                              child: Text("Book Now",
                                                style: TextStyle(fontSize: 17,
                                                    fontWeight: FontWeight
                                                        .bold),),
                                            ))

                                    )),
                                    new Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    Container(child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },

                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            child: Center(
                                              child: Text("Cancel",
                                                style: TextStyle(fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red),),
                                            ))

                                    )),
                                    new Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                  ]))
                      )))));
    });}

}