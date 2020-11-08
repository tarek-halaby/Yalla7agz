import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  final List<String> entries = <String>['First Name :', 'Last Name :', 'Username :', 'E-mail :','Mobile Phone :','Birthday :'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Container(
          child: new Column(
              children: [
                new Image.asset(
                  'assets/images/profile.png',
                  width: 120.0,
                  height: 120.0,
                ),
                new Container(

                    width: MediaQuery.of(context).size.width * 0.70,
                    margin: EdgeInsets.all(10),
                    child:changeProfilePic()
                )
              ],
          )
    ),
                new Expanded(
                    child: new ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 50,
                          child: Text('${entries[index]}')
                      );
                    }
                )
                ),
                editProfile()

    ])));
  }
}
class changeProfilePic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    RaisedButton button = RaisedButton(
      onPressed: () {
        onClick(context);
      },
      shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(9.0),
          side: BorderSide(color: Colors.green)
      ),
      color: Colors.green,
      child: Text(
        "Change",
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
class editProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    RaisedButton button = RaisedButton(
      onPressed: () {
        onClick(context);
      },
      shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(9.0),
          side: BorderSide(color: Colors.green)
      ),
      color: Colors.green,
      child: Text(
        "Edit Profile",
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