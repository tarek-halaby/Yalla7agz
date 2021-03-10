import 'package:Yalla7agz/providers/arenas.dart';
import 'package:Yalla7agz/widgets/loading_indicator.dart';
import 'package:Yalla7agz/widgets/message_widget.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:place_picker/place_picker.dart';

class addArena extends StatefulWidget {
  addArena({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _addArenaState();
}

class _addArenaState extends State<addArena> {
  final _addArenaFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();
   String long=null;
   String lat=null;
  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    countryController.dispose();
    cityController.dispose();
    mobileController.dispose();
    regionController.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
                        key: _addArenaFormKey,
                        child: Container(
                            width: _width * 0.87,
                            margin: EdgeInsets.only(
                                top: _height * 0.04, bottom: _height * 0.02),
                            child: Column(children: <Widget>[
                              new Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Add Arena",
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
                                  "Arena Name: ",
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
                                  controller: nameController,
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z ]"))
                                  ],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter your Arena Name";
                                    } else if (value.length < 2) {
                                      return "* Please enter valid Name";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: 'Your arena name',
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
                                  "Arena Mobile: ",
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
                                  controller: mobileController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter your Arena number";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: 'Your arena number',
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
                                  "Address: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.015,
                              ),

                              Container(
                                width: _width,
                                height: _height*0.055,
                                child: RaisedButton(
                                    onPressed: ()async{
                                      Geolocator.checkPermission().then((status) { print('status: $status'); });
                                      try {
                                        Position newPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                                        List<Placemark> placemarks = await placemarkFromCoordinates(newPosition.latitude, newPosition.longitude);

                                        var first = placemarks.first;

                                        setState(() {
                                          countryController.text=first.country;
                                          cityController.text=first.administrativeArea;
                                          regionController.text=first.street;
                                          lat=newPosition.latitude.toString();
                                          long=newPosition.longitude.toString();
                                        });
                                        return "${first.country}, ${first.administrativeArea}, ${first.street}";

                                      } catch (e) {
                                        return "N/A";
                                      }
                                    },
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(

                                        borderRadius:
                                        BorderRadius.circular(10),
                                        side: BorderSide(
                                            color: Color(0x4D71A411))),
                                    color: Colors.white,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,

                                          child: Container(
                                            height: _height*0.055,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF71A411),
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(10)),

                                              color:Color(0xFF71A411),
                                            ),
                                            child:Icon(Icons.location_on,color: Colors.white,),
                                            margin: EdgeInsets.all(0),
                                          ),
                                        ),
                                        Expanded(
                                            flex:11,
                                            child:Container(child:Center(child:Text("Current Arena Location",
                                              style: TextStyle(
                                                color: Color(0xFF71A411),
                                                fontSize: 15,
                                              ),

                                            ),),)
                                        )
                                      ],
                                    )
                                ),
                              ),
                              SizedBox(
                                height: _height * 0.025,
                              ),
                              new Container(
                                width: _width * 0.87,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Country: ",
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
                                  controller: countryController,
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z ]"))
                                  ],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter your Country Name";
                                    } else if (value.length < 2) {
                                      return "* Please enter valid Country";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: 'Your Country name',
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
                                  "City Name: ",
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
                                  controller: cityController,
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z ]"))
                                  ],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter your City Name";
                                    } else if (value.length < 2) {
                                      return "* Please enter Valid city Name";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: 'Your city name',
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
                                  "region Name: ",
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
                                  controller: regionController,
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z ]"))
                                  ],
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Please enter your region Name";
                                    } else if (value.length < 2) {
                                      return "* Please enter valid region Name";
                                    }
                                    return null;
                                  },
                                  decoration: new InputDecoration(
                                    hintText: 'Your region name',
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
                                    if (_addArenaFormKey.currentState.validate()) {
                                      if(lat==null||long==null){
                                        var errorMessage = 'please get current arena location';
                                        MessageBoxModal(context).showMessageBoxModal(errorMessage);
                                        return;
                                      }
                                      DialogBuilder(context).showLoadingIndicator('Loading');
                                      await Provider.of<Arenas>(context, listen: false)
                                          .addArena(
                                        nameController.text,
                                        mobileController.text,
                                        countryController.text,
                                        cityController.text,
                                        regionController.text,
                                        lat,
                                        long
                                      ).whenComplete(() async{
                                        await Provider.of<Arenas>(context,listen: false).getArenas(true);                                        DialogBuilder(context).hideOpenDialog();
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