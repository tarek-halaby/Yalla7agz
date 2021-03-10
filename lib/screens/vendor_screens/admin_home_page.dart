import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/providers/arenas.dart';
import 'package:Yalla7agz/widgets/admin_home_item.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class adminHomePage extends StatefulWidget {
  adminHomePage({Key key}) : super(key: key);

  @override
  adminHomePageState createState() => adminHomePageState();
}
class adminHomePageState extends State<adminHomePage>{
  int _current = 0;
  List<Arena> _arenas=new List<Arena>();
    List<Widget> itemsList = new List<Widget>();
   _refreshArenas(BuildContext context) async {
    List<Widget> itemsList = new List<Widget>();

    await Provider.of<Arenas>(context,listen: false).getArenas(true);
    this._arenas=await Provider.of<Arenas>(context,listen: false).arenas;
    for (var i = 0; i < _arenas.length; i++) {
    await Provider.of<Arenas>(context,listen: false).getCourts(this._arenas[i].id);

      itemsList.add(AdminHomeItem(this._arenas[i]));
    }
    itemsList.add(AdminHomeItem(null));

    return itemsList;
  }
  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return FutureBuilder<Object>(
        future: _refreshArenas(context),
    builder: (context, snapshot) {
    return snapshot.connectionState == ConnectionState.waiting
    ? Center(
    child: CircularProgressIndicator(),
    )
        :  Consumer<Arenas>(
    builder: (context, arenaData, child) =>
    Container(
        width: _width * 0.87,
        margin: EdgeInsets.only(top: _height * 0.04, bottom: _height * 0.03),
        child: Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Home",
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
            painter: CurvePainter(Color(0xFF71A411), Color(0x2671A411),3),
          ),
          SizedBox(
            height: _height * 0.010,
          ),
          Container(
            child: CarouselSlider(
              items: snapshot.data,
              options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 1.0,
                  height: _height * 0.58,
                  onPageChanged: (index, reason) {
                      _current = index;
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.from(snapshot.data).map((url) {
              int index = List<Widget>.from(snapshot.data).indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ])));
  });
}}
