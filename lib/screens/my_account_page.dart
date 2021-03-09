import 'package:Yalla7agz/providers/auth.dart';
import 'package:Yalla7agz/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Yalla7agz/widgets/painted_line.dart';
import 'package:Yalla7agz/models/user.dart';

class myAccount extends StatelessWidget {
  Future<void> _refreshUserData(BuildContext context) async {
    await Provider.of<Users>(context,listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    User loggedUser = User('client@miu.com', "",
        name: 'omar', mobilePhone: '01178546854', isClient: true);
    return FutureBuilder<Object>(
        future: _refreshUserData(context),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshUserData(context),
                  child: Consumer<Users>(
                  builder: (context, userData, child) =>
                  Container(
                      alignment: Alignment.center,
                      width: _width * 0.87,
                      margin: EdgeInsets.only(
                          top: _height * 0.04, bottom: _height * 0.03),
                      child: Column(children: <Widget>[
                        new Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "My Account",
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
                              Color(0xFF71A411), Color(0x2671A411), 2),
                        ),
                        SizedBox(
                          height: _height * 0.025,
                        ),

                             Container(
                                child: Text(
                                  "Name: " + userData.user.getName(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                margin: EdgeInsets.only(left: _width * 0.03),
                              ),
                        SizedBox(
                          height: _height * 0.05,
                        ),
                        Row(children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Text(
                                "Email: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Center(
                                  child: Text(
                                    userData.user.getEmail(),
                                style: TextStyle(fontSize: 15),
                              )),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: _height * 0.03,
                        ),
                        Row(children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Text(
                                "Password: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Center(
                                  child: Text(
                                "*****",
                                style: TextStyle(fontSize: 15),
                              )),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: _height * 0.03,
                        ),
                        Row(children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Text(
                                "Mobile Number: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: Center(
                                  child: Text(
                                    userData.user.getMobileNumber(),
                                style: TextStyle(fontSize: 15),
                              )),
                            ),
                          ),
                        ]),
                        new Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/editProfile');
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Center(
                                  child: Text(
                                    "Edit Profile",
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
                            onTap: () {
                              Navigator.pushNamed(context, '/changePassword');
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Center(
                                  child: Text(
                                    "Change Password",
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
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await Provider.of<Auth>(context, listen: false)
                                  .logout();
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Center(
                                  child: Text(
                                    "Log out",
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
                      ]))));
        });
  }
}
