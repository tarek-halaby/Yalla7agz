import 'package:Yalla7agz/models/arena.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';

class AdminHomeItem extends StatelessWidget{
  final List<String> calendar = ["1:00 PM To 2:00 PM", "2:00 PM To 3:00 PM", "4:00 PM To 5:00 PM","5:00 PM To 6:00 PM","7:00 PM To 8:00 PM",
    "8:00 PM To 9:00 PM"];
  final List<String> reservers = ["Ahmed", "Mohamed", "Mahomoud","ziad","Tarek","Khaled"];
  final List<String> courts = ["Court 1","Court 2","Court 3","Court 4","Court 5","Court 6"];
  Arena arena;
  AdminHomeItem(this.arena);
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(

              margin: EdgeInsets.only(top: _height*0.04,bottom: _height*0.03,left: _width*0.07,right: _width*0.07),
              child: this.arena==null?Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/addArena');
                    },
                      child:Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Text("Add Arena",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    Container(
                color: Colors.white70,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: _height*0.2),
                child:Container(
                  color:Color(0xFF71A411) ,
                  height: _height*0.06,
                  width: _height*0.06,
                  child: Icon(Icons.add)
                )
              )])))
                    :Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Text(arena.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    SizedBox(height: _height*0.015,),
                    CustomPaint(
                      size: Size(_width*0.87, _height*0.005),
                      painter: CurvePainter2(Colors.black,Colors.black12),
                    ),
                    SizedBox(height: _height*0.015,),
                    new Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Live Schedule",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    new Flexible(
                        child: ListView.builder(
                            itemCount: this.arena.courts.length+1,
                            itemBuilder: (context, index) {
                              if(index==this.arena.courts.length){
                                return Container(
                                    height:_height*0.09 ,
                                    child:Card(
                                    child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/addCourt',arguments: this.arena.id);

                                    },
                              child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Center(
                                  child:Icon(Icons.add)                              )
                              ))));
                              }
                              return HomeList(
                                time: "${calendar[index]}",
                                reserver: "${reservers[index]}",
                                place: "Court : ${this.arena.courts[index].number}",
                              );
                            },
                        )

                    )
                  ]));
  }

}
class HomeList extends StatelessWidget {
  HomeList({
    this.time,
    this.reserver,
    this.place,
  });

  final String reserver;
  final String time;
  final String place;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height*0.09;
    return Column(
      children: [
        Container(
            height:_height ,
            child:Card(
              child: InkWell(
                onTap: () {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Center(
                            child: Text(
                              place,
                              style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                            )),
                      ),
                      Expanded(
                        flex: 6,
                        child: Center(
                            child: Text(
                              time,
                              style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                            )),
                      ),
                      Expanded(
                          flex: 4,
                          child: Center(
                              child: Text(
                                reserver,
                                style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                              ))),
                      Expanded(
                        flex: 1,
                        child: Icon(Icons.chevron_right),
                      )
                    ],
                  ),
                ),
              ),))
      ],
    );
  }
}