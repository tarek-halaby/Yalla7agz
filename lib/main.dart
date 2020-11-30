import 'package:Yalla7agz/screens/booked.dart';
import 'package:Yalla7agz/screens/booking.dart';
import 'package:Yalla7agz/screens/booking_details.dart';
import 'package:Yalla7agz/screens/change_password.dart';
import 'package:Yalla7agz/screens/courtDetails.dart';
import 'package:Yalla7agz/screens/edit_profile.dart';
import 'package:Yalla7agz/screens/home_page.dart';
import 'package:Yalla7agz/screens/notifications.dart';
import 'package:Yalla7agz/screens/signup.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
        '/login': (context) =>Login(),
        '/signUp': (context) =>SignUp(),
        '/home': (context) =>Home(),
        '/notification': (context) =>Notifications(),
        '/courtDetails': (context) =>courtDetails(),
        '/booking': (context) =>bookingStatefulWidget(),
        '/booked': (context) =>booked(),
        '/editProfile': (context) =>editProfile(),
        '/changePassword': (context) =>changePassword(),
        '/bookingDetails': (context) =>bookingDetails(),
        },
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
            }),
      theme: ThemeData(
      primaryColor: Color(0xFF71A411)
      ),
    );
  }
}

