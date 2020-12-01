import 'file:///F:/grad/Yalla7agz/lib/screens/client_screens/booked.dart';
import 'file:///F:/grad/Yalla7agz/lib/screens/client_screens/booking.dart';
import 'file:///F:/grad/Yalla7agz/lib/screens/client_screens/booking_details.dart';
import 'file:///F:/grad/Yalla7agz/lib/screens/client_screens/change_password.dart';
import 'file:///F:/grad/Yalla7agz/lib/screens/client_screens/courtDetails.dart';
import 'file:///F:/grad/Yalla7agz/lib/screens/client_screens/edit_profile.dart';
import 'package:Yalla7agz/screens/client_screens/home_page.dart';
import 'package:Yalla7agz/screens/client_screens/notifications.dart';
import 'package:Yalla7agz/screens/signup.dart';
import 'package:Yalla7agz/screens/vendor_screens/admin_home.dart';
import 'package:Yalla7agz/screens/vendor_screens/admin_notifications.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/client_screens/home.dart';
import 'package:Yalla7agz/screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  Future<int> _getLoggedInStatus() async
  {
    SharedPreferences pref= await SharedPreferences.getInstance();
    if(pref.getBool('isLoggedIn'))
      {
         if(pref.getBool('isClient'))
           {
             return 1;
           }
         else
           {
             return 2;
           }
      }
    return 0;

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
        '/adminHome': (context) =>adminHome(),
        '/adminnotification': (context) =>adminNotifications(),

        },
        title: "Yalla 7agz",
        home: FutureBuilder<int>(
            future: _getLoggedInStatus(),
            builder:(BuildContext context, AsyncSnapshot<int> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.data == 2) {

                    return adminHome();
                  }
                  else if (snapshot.data == 1) {

                    return Home();
                  }
                  else
                  {
                    return Login();
                  }
              }
            }),
      theme: ThemeData(
      primaryColor: Color(0xFF71A411)
      ),
    );
  }
}

