import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/models/request.dart';
import 'package:Yalla7agz/providers/requests.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/widgets/message_widget.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
class bookingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context).settings.arguments as List;
    final Request request=args[0];
    final Arena arena=args[1];
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
                  Navigator.pushNamed(context, '/notification');
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
                      "Booking Details",
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
                        CurvePainter(Color(0xFF71A411), Color(0x2671A411), 2),
                  ),
                  SizedBox(
                    height: _height * 0.025,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text(
                          "Request id: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Text(
                          request.id,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.025,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text(
                          "Status: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Text(
                          request.status,
                          style:
                              TextStyle(fontSize: 15, color: Colors.blueAccent),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.015,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text(
                          "Arena: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Text(
                          arena.name,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ClipOval(
                        child: Material(
                          color: Color(0x4071A411), // button color
                          child: InkWell(
                            splashColor: Color(0xD171A411), // inkwell color
                            child: SizedBox(
                                width: _height * 0.05,
                                height: _height * 0.05,
                                child: Icon(
                                  Icons.location_on,
                                )),
                            onTap: () async{
                              final availableMaps = await MapLauncher.installedMaps;
                              await availableMaps.first.showMarker(
                                coords: Coords(double.parse(arena.country.city.region.address.long), double.parse(arena.country.city.region.address.lat)),
                                title: "Ocean Beach",
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: _height * 0.015,
                  ),

                  SizedBox(
                    height: _height * 0.025,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text(
                          "Date: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Text(
                          request.userBooking.date,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.025,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text(
                          "From: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Text(
                          request.userBooking.from,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.025,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text(
                          "To: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Text(
                          request.userBooking.to,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: _height * 0.025,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text(
                          "Total price: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Text(
                          request.userBooking.totalPrice,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ]),
                  new Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                  InkWell(
                      onTap: () async{
                        DialogBuilder(context).showLoadingIndicator('Loading');
                        await Provider.of<Requests>(context, listen: false)
                            .cancelReq(request.id
                        ).whenComplete(() async{
                          await Provider.of<Requests>(context,listen: false).getRequests();
                          DialogBuilder(context).hideOpenDialog();
                          Navigator.pop(context);
                        }).catchError((error) {
                          var errorMessage = 'Adding Failed';
                          MessageBoxModal(context).showMessageBoxModal(errorMessage);
                        });
                      },

                      child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child:Center(
                            child: Text("Cancel Request",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red),),
                          ))

                  ),
                  new Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                  Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                              height: _height * 0.07,
                              alignment: Alignment.bottomCenter,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Color(0xFF71A411))),
                                color: Color(0xFF71A411),
                                child: Text(
                                  "Return to home",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )))),
                ]))));
  }
}
