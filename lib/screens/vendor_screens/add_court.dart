import 'package:Yalla7agz/providers/arenas.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/widgets/message_widget.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class addCourt extends StatefulWidget {
  addCourt({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _addCourtState();
}

class _addCourtState extends State<addCourt> {
  final _addCourtFormKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final pricePerHourController = TextEditingController();
  final TypeController = TextEditingController();
  final maxPlayersController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    numberController.dispose();
    pricePerHourController.dispose();
    TypeController.dispose();
    maxPlayersController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final arenaId =
    ModalRoute.of(context).settings.arguments as String;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Container(),
            centerTitle: true,
            title: Center(
                child: Text("Yalla 7agz",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]),
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child:SingleChildScrollView(

                child:Center(
                    child: Form(
                        key: _addCourtFormKey,
                        child: Container(
                            width: _width * 0.87,
                            margin: EdgeInsets.only(
                                top: _height * 0.04, bottom: _height * 0.02),
                            child: Column(children: <Widget>[
                              new Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Add Court",
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
                                painter: CurvePainter(
                                    Color(0xFF71A411), Color(0x2671A411), 3),
                              ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                              new Container(
                                width: _width * 0.87,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Court Number: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.red),
                                ),
                              ),

                              Container(
                                width:_width*0.87,
                                child: TextFormField(

                                  textInputAction: TextInputAction.next,
                                  controller: numberController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter  court Number";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: ' court number',
                                  ),
                                  autofocus: false,
                                ),
                              ),

                              SizedBox(
                                height: _height * 0.025,
                              ),
                              new Container(
                                width: _width * 0.87,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Court Price: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.red),
                                ),
                              ),

                              Container(
                                width:_width*0.87,
                                child: TextFormField(

                                  textInputAction: TextInputAction.next,
                                  controller: pricePerHourController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter  court Price";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: ' court Price',
                                  ),
                                  autofocus: false,
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                              new Container(
                                width: _width * 0.87,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Court type: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.red),
                                ),
                              ),

                              Container(
                                width:_width*0.87,
                                child: TextFormField(

                                  textInputAction: TextInputAction.next,
                                  controller: TypeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter  court type";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: ' court type',
                                  ),
                                  autofocus: false,
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                              new Container(
                                width: _width * 0.87,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Max Players: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.red),
                                ),
                              ),

                              Container(
                                width:_width*0.87,
                                child: TextFormField(

                                  textInputAction: TextInputAction.next,
                                  controller: maxPlayersController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter  Max Players";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: 'Max Players ',
                                  ),
                                  autofocus: false,
                                ),
                              ),
                              new Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),

                              InkWell(
                                  onTap: () async{
                                    if (_addCourtFormKey.currentState.validate()) {
                                      DialogBuilder(context).showLoadingIndicator('Loading');
                                      await Provider.of<Arenas>(context, listen: false)
                                          .addCourt(
                                          numberController.text,
                                          pricePerHourController.text,
                                          TypeController.text,
                                          maxPlayersController.text,
                                          arenaId,
                                      ).whenComplete(() async{
//                                        await Provider.of<Arenas>(context,listen: false).getArenas();                                        DialogBuilder(context).hideOpenDialog();
                                        Navigator.pop(context);
                                      }).catchError((error) {
                                        var errorMessage = 'Adding Failed';
                                        MessageBoxModal(context).showMessageBoxModal(errorMessage);
                                      });
                                    }
                                  },
                                  child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Center(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))),
                              new Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ))),
                              new Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                            ])))))));
  }
}