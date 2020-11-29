import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/login.dart';
import 'package:Yalla7agz/models/user.dart';
import 'package:Yalla7agz/screens/home_page.dart';
import 'package:Yalla7agz/screens/my_requests_page.dart';
import 'package:Yalla7agz/screens/my_account_page.dart';
import 'package:Yalla7agz/screens/book_now_page.dart';
import 'package:Yalla7agz/screens/notifications.dart';
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
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    homePage(),
    bookNowPage(),
    myRequests(),
    myAccount(),
  ];

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
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Notifications()
                    ),
                );
              },
            )]
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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