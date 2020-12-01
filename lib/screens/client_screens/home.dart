import 'file:///F:/grad/Yalla7agz/lib/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/login.dart';
import 'package:Yalla7agz/models/user.dart';
import 'package:Yalla7agz/screens/client_screens/home_page.dart';
import 'package:Yalla7agz/screens/client_screens/my_requests_page.dart';
import 'file:///F:/grad/Yalla7agz/lib/screens/my_account_page.dart';
import 'file:///F:/grad/Yalla7agz/lib/screens/client_screens/book_now_page.dart';
import 'package:Yalla7agz/screens/client_screens/notifications.dart';
import 'package:Yalla7agz/models/notification.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return HomeStatefulWidget();
  }
}
class HomeStatefulWidget extends StatefulWidget {
  HomeStatefulWidget({Key key}) : super(key: key);

  @override
  _HomeStatefulWidgetState createState() => _HomeStatefulWidgetState();
}
class _HomeStatefulWidgetState extends State<HomeStatefulWidget> {
  int _selectedIndex = 0;
  notificationController cont=new notificationController();

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget body() {
    switch(_selectedIndex) {
      case 0:
        return homePage(showMoreButton);
        break;
      case 1:
        return bookNowPage();
        break;
      case 2:
        return myRequests();
        break;
      case 3:
        return myAccount();
        break;
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void showMoreButton() {
    setState(() {
      _selectedIndex = 1;
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
                Navigator.pushNamed(
                    context,
                    '/notification'
                );
              },
            )]
      ),
      body: Center(
        child: body(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Book Now',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'My Requests',
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