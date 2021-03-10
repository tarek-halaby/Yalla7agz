import 'package:Yalla7agz/screens/my_account_page.dart';
import 'package:Yalla7agz/screens/vendor_screens/admin_home_page.dart';
import 'package:Yalla7agz/screens/vendor_screens/admin_requests.dart';
import 'package:flutter/material.dart';

class adminHome extends StatefulWidget {
  adminHome({Key key}) : super(key: key);

  @override
  _adminHomeState createState() => _adminHomeState();
}
class _adminHomeState extends State<adminHome> {
  int _selectedIndex = 0;

  Widget body() {
    switch(_selectedIndex) {
      case 0:
        return adminHomePage();
        break;
      case 1:
        return adminRequests();
        break;
      case 2:
        return myAccount();
        break;
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF71A411),
          leading: Container(
          ),
          title: Center(
              child: Text("Yalla 7agz",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25))),
          actions: <Widget>[
            IconButton(
              icon:  new Stack(
                  children: <Widget>[
                    new Icon(Icons.notifications),
                    new Positioned(  // draw a red marble
                      top: 0.0,
                      right: 0.0,
                      child: new Icon(Icons.brightness_1, size: 8.0,
                          color: Colors.redAccent),
                    )
                  ]
              ),
              onPressed: () {
              Navigator.pushNamed(context, '/adminnotification');
                },
            )]
      ),
      body: Center(
        child: body(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Stack(
                children: <Widget>[
                  new Icon(Icons.file_copy),
                  new Positioned(  // draw a red marble
                    top: 0.0,
                    right: 0.0,
                    child: new Icon(Icons.brightness_1, size: 8.0,
                        color: Colors.redAccent),
                  )
                ]
            ),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF71A411),
        onTap: _onItemTapped,
      ),
    );
  }
}