import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/models/request.dart';
import 'package:Yalla7agz/providers/arenas.dart';
import 'package:Yalla7agz/providers/requests.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:Yalla7agz/models/court.dart';
import 'package:provider/provider.dart';

class myRequests extends StatelessWidget {
  List<Request> _requests = new List<Request>();
  List<Arena> _arenas = new List<Arena>();

  _refreshRequests(BuildContext context) async {
    await Provider.of<Requests>(context, listen: false).getRequests();
    await Provider.of<Arenas>(context, listen: false).getArenas(false);
      this._arenas = await Provider.of<Arenas>(context, listen: false).arenas;
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
              "My Requests",
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
            painter: CurvePainter(Color(0xFF71A411), Color(0x2671A411), 2),
          ),
          new Flexible(
              child: ListView.builder(
                  itemCount: this._requests.length,
                  itemBuilder: (context, index) {
                    return requestsList(
                      arena:_arenas[_arenas.indexWhere((arena) => arena.id == _requests[index].userBooking.arenaId)] ,
                      request:_requests[index],
                      place:_arenas[_arenas.indexWhere((arena) => arena.id == _requests[index].userBooking.arenaId)].name,
                      time: "${_requests[index].userBooking.from}" +
                          " - " +
                          "${_requests[index].userBooking.to}",
                      response: Text(
                        "${_requests[index].status}",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
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
    this.request,
    this.arena,
  });

  final Request request;
  final Arena arena;
  final String place;
  final String time;
  final Widget response;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/bookingDetails',arguments: [this.request,this.arena]);
          },
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
                Expanded(
                  flex: 4,
                  child: Center(child: response),
                )
              ],
            ),
          ),
        ),
        new Divider(
          color: Colors.black12,
          thickness: 1,
        )
      ],
    );
  }
}
