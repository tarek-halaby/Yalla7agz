import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/home.dart';
import 'package:Yalla7agz/screens/admin_home.dart';
import 'package:Yalla7agz/screens/register.dart';
import 'package:Yalla7agz/auth.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Center(
              child: Text("Yalla 7agz",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25))),
            ),
        body: Container(
          color: Colors.white,
          child: Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child:Text("Login",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)

                      )
                  ),
                  new Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter Username Here',
                        ),
                        autofocus: false,
                      )),
                  new Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter Password Here',
                        ),
                        autofocus: false,
                        obscureText: true,
                      )),
                  new Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      margin: EdgeInsets.all(10),
                      child: LoginButton()),
                  new Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      margin: EdgeInsets.all(10),
                      child:RegisterButton()
                  )
                ],
              )),
        )
    );
  }
}
class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    RaisedButton button = RaisedButton(
      onPressed: () {
        onClick(context);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.green)
      ),
      color: Colors.green,
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );

    return Container(
      child: button,
    );
  }

  void onClick(BuildContext context){
//    Navigator.pushReplacement(
//      context,
//      MaterialPageRoute(builder: (context) => AdminHome()),
//    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );

  }
}
class RegisterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    RaisedButton button = RaisedButton(
      onPressed: () {
        onClick(context);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.green)
      ),
      color: Colors.green,
      child: Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );

    return Container(
      child: button,
    );
  }

  void onClick(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }
}