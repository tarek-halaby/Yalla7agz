import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(top: 20),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text("Settings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

              ),
              new Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child:RaisedButton(
                  onPressed: () {
                  },

                  child: Text('Language'),
                  color: Colors.grey,
                  )
              ),
              new Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child:RaisedButton(
                    onPressed: () {
                    },

                    child: Text('Notifcation'),
                    color: Colors.grey,
                  )
              ),
              new Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child:RaisedButton(
                    onPressed: () {
                    },

                    child: Text('About'),
                    color: Colors.grey,
                  )
              ),
              new Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child:RaisedButton(
                    onPressed: () {
                    },

                    child: Text('Privacy Policy'),
                    color: Colors.grey,
                  )
              ),
              new Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child:RaisedButton(
                    onPressed: () {
                    },

                    child: Text('Terms of use'),
                    color: Colors.grey,
                  )
              )
            ]
    ));
  }
}