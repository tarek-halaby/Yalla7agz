import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/models/request.dart';
import 'package:Yalla7agz/providers/arenas.dart';
import 'package:Yalla7agz/providers/requests.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:Yalla7agz/models/court.dart';
import 'package:provider/provider.dart';

class adminRequests extends StatelessWidget {
  List<Request> _requests = new List<Request>();
  List<Arena> _arenas = new List<Arena>();

  _refreshRequests(BuildContext context) async {
    await Provider.of<Arenas>(context, listen: false).getArenas(true);
    this._arenas = await Provider.of<Arenas>(context, listen: false).arenas;
    await Provider.of<Requests>(context, listen: false).getAdminRequests(this._arenas);
    this._requests = await Provider.of<Requests>(context, listen: false).requests;

  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return FutureBuilder<Object>(
        future: _refreshRequests(context),
    builder: (context, snapshot) {
    return snapshot.connectionState == ConnectionState.waiting
    ? Center(
    child: CircularProgressIndicator(),
    )
        : RefreshIndicator(
    onRefresh: () => _refreshRequests(context),
    child: Consumer<Requests>(
    builder: (context, arenaData, child) =>
    Container(
        width: _width * 0.87,
        margin: EdgeInsets.only(top: _height * 0.04, bottom: _height * 0.03),
        child: Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Requests",
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
            painter: CurvePainter(Color(0xFF71A411), Color(0x2671A411), 3),
          ),
          SizedBox(
            height: _height * 0.025,
          ),
          new Flexible(
              child: ListView.builder(
                  itemCount: _requests.length,
                  itemBuilder: (context, index) {
                    return requestsList(
                      requestId: _requests[index].id,
                      place: "${_arenas[_arenas.indexWhere((element) => element.id==_requests[index].userBooking.arenaId)].name}",
                      time: "${_requests[index].userBooking.from}" +
                          " - " +
                          "${_requests[index].userBooking.to}",
                      response: "${_requests[index].status}",
                    );
                  }))
        ]))));
  });
}
}

class requestsList extends StatelessWidget {
  requestsList({
    this.place,
    this.time,
    this.response,
    this.requestId,
  });

  final String requestId;
  final String place;
  final String time;
  final String response;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height*0.09;
    double spaceWidth = MediaQuery.of(context).size.height*0.01;

    return Column(
      children: [
        Container(
        height:height ,
        child:Card(
        child:InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Center(
                      child: Text(
                        place,
                        style: TextStyle(fontSize: 13),
                      )),
                ),
                Expanded(
                    flex: 4,
                    child: Center(
                        child: Text(
                          time,
                          style: TextStyle(fontSize: 13),
                        ))),
                response=='Pending'?Expanded(
                  flex: 4,
                  child: Center(child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          ClipOval(
                            child: Material(
                              color: Colors.green, // button color
                              child: InkWell(
                                splashColor: Colors.green[900], // inkwell color
                                child: SizedBox(width: height/2, height: height/2, child: Icon(Icons.check,color: Colors.white)),
                                onTap: () async{
                                  DialogBuilder(context).showLoadingIndicator('Loading');
                                  await Provider.of<Requests>(context, listen: false)
                                      .respondRequest(true,requestId
                                  ).whenComplete(() async{
                                    DialogBuilder(context).hideOpenDialog();
                                    Navigator.pop(context);
                                  }).catchError((error) {
                                    var errorMessage = 'Adding Failed';
                                    MessageBoxModal(context).showMessageBoxModal(errorMessage);
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: spaceWidth,),
                          ClipOval(
                            child: Material(
                              color: Colors.red, // button color
                              child: InkWell(
                                splashColor: Colors.red[900], // inkwell color
                                child: SizedBox(width: height/2, height: height/2, child: Icon(Icons.clear,color: Colors.white,)),
                                onTap: () async{
                                  DialogBuilder(context).showLoadingIndicator('Loading');
                                  await Provider.of<Requests>(context, listen: false)
                                      .respondRequest(false,requestId
                                  ).whenComplete(() async{
                                    DialogBuilder(context).hideOpenDialog();
                                  }).catchError((error) {
                                    var errorMessage = 'Adding Failed';
                                    MessageBoxModal(context).showMessageBoxModal(errorMessage);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                ):Expanded(
                  flex: 4,
                  child: Text(response),
                )
              ],
            ),
          ),
        )))
      ],
    );
  }
}
