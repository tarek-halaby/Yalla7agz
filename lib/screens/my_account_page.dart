import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Yalla7agz/shared/painted_line.dart';
import 'package:Yalla7agz/models/user.dart';

class myAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
  double _width = MediaQuery.of(context).size.width;
  User loggedUser=User(2,'client@miu.com','client','omar','ahmed','01178546854',true);
    return  Container(
      alignment: Alignment.center,
        width: _width*0.87,
        margin: EdgeInsets.only(top: _height*0.04,bottom: _height*0.03),
        child: Column(
          children: <Widget>[
        new Container(
        alignment: Alignment.centerLeft,
          child: Text("My Account",
            style: TextStyle(
                fontSize: 25,
                color: Color(0xFF71A411),
                fontWeight: FontWeight.bold
            ),),
        ),
        SizedBox(height: _height*0.025,),
        CustomPaint(
          size: Size(_width*0.87, _height*0.006),
          painter: CurvePainter(Color(0xFF71A411),Color(0x2671A411),2),
        ),
            SizedBox(height: _height*0.025,),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                      child:ClipOval(child:Image.asset("assets/images/profile.png")),

                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                      child:Text("Name: "+loggedUser.getName(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    margin: EdgeInsets.only(left: _width*0.03),
                  ),
                ),
              ],
            ),
        SizedBox(height: _height*0.05,),
        Row(
            children: <Widget>[
            Expanded(
            flex: 4,
            child: Container(
              child:Text("Email: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
            ),
             ),
              Expanded(
            flex: 8,
            child: Container(
              child:Center(child:Text(loggedUser.getEmail(),style: TextStyle(fontSize: 15),)) ,
            ),
             ),
        ] ),
            SizedBox(height: _height*0.03,),
            Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      child:Text("Password: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      child:Center(child:Text("*****",style: TextStyle(fontSize: 15),)) ,
                    ),
                  ),
                ] ),
            SizedBox(height: _height*0.03,),

            Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      child:Text("Mobile Number: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) ,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      child:Center(child:Text(loggedUser.getMobileNumber(),style: TextStyle(fontSize: 15),)) ,
                    ),
                  ),
                ] ),
            new Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/editProfile');
                },

                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child:Center(
                    child: Text("Edit Profile",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ))

            ),
            new Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/changePassword');
                },

                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child:Center(
                    child: Text("Change Password",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ))

            ),
            new Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            InkWell(
                onTap: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) => Login()),
                          (Route<dynamic> route) => route is Login
                  );
                },

                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child:Center(
                    child: Text("Log out",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red),),
                  ))

            ),
            new Divider(
              color: Colors.black12,
              thickness: 1,
            ),
          ]));
  }
}