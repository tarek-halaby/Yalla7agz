import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/home_page.dart';
import 'package:Yalla7agz/screens/settings_page.dart';
import 'package:Yalla7agz/screens/profile_page.dart';
import 'package:Yalla7agz/screens/search_page.dart';

class Home extends StatelessWidget {
  static const String _title = 'Home Page';

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
    profile(),
    settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void goToSearch()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Search()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text("Yalla 7agz",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25))),
            actions: <Widget>[
              IconButton(
              icon: Icon(Icons.search),
                onPressed: () {
                goToSearch();
                             },
         )]
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}