import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/home.dart';
import 'package:Yalla7agz/screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  Future<bool> _getLoggedInStatus() async
  {
    SharedPreferences pref= await SharedPreferences.getInstance();
    return pref.getBool('isLoggedIn') ?? false;

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Yalla 7agz",
        home: FutureBuilder<bool>(
            future: _getLoggedInStatus(),
            builder:(BuildContext context, AsyncSnapshot<bool> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.data == false) {

                    return Login();
                  }
                  else {
                    return Home();
                  }
              }
            }));
  }
}

