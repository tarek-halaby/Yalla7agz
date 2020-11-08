import 'package:flutter/material.dart';

class Register extends StatelessWidget {
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
          width: MediaQuery.of(context).size.width * 0.70,
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child:Center(
              child: new Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Expanded(
                      child: Center(
                          child:Text("Register",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)

                      )
                  ),
                  new Expanded(

                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter First Name Here',
                        ),
                        autofocus: false,
                      )),
                  new Expanded(
                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter Last name Here',
                        ),
                        autofocus: false,
                      )),
                  new Expanded(
                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter Username Here',
                        ),
                        autofocus: false,
                      )),
                  new Expanded(
                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter Password Here',
                        ),
                        autofocus: false,
                        obscureText: true,
                      )),
                  new Expanded(
                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter E-mail Here',
                        ),
                        autofocus: false,
                      )),
                  new Expanded(
                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter Mobile Number Here',
                        ),
                        autofocus: false,
                      )),
                  new Expanded(
                      child: TextField(
                        decoration: new  InputDecoration(
                          hintText: 'Enter Birthday Here',
                        ),
                        autofocus: false,
                      )),
                  new Expanded(
                      child:SubmitButton()
                  )
                ],
              )),
        )
    );
  }
}
class SubmitButton extends StatelessWidget {

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
        "Submit",
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

  }
}