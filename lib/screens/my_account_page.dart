import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;

    return  Container(
      alignment: Alignment.center,

        child: RaisedButton(
          onPressed: () async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', false);
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (BuildContext context) => Login()),
                    (Route<dynamic> route) => route is Login
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0),
              side: BorderSide(
                  color: Color(0xFF71A411))),
          color: Color(0xFF71A411),
          child: Text(
            "log out",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ));
  }
}