import 'package:Yalla7agz/providers/arenas.dart';
import 'package:Yalla7agz/providers/requests.dart';
import 'package:Yalla7agz/providers/users.dart';
import 'package:Yalla7agz/screens/client_screens/booked.dart';
import 'package:Yalla7agz/screens/client_screens/booking.dart';
import 'package:Yalla7agz/screens/client_screens/booking_details.dart';
import 'package:Yalla7agz/screens/client_screens/change_password.dart';
import 'package:Yalla7agz/screens/client_screens/courtDetails.dart';
import 'package:Yalla7agz/screens/client_screens/edit_profile.dart';
import 'package:Yalla7agz/screens/client_screens/notifications.dart';
import 'package:Yalla7agz/screens/forgot_password.dart';
import 'package:Yalla7agz/screens/signup.dart';
import 'package:Yalla7agz/screens/vendor_screens/add_arena.dart';
import 'package:Yalla7agz/screens/vendor_screens/add_court.dart';
import 'package:Yalla7agz/screens/vendor_screens/admin_home.dart';
import 'package:Yalla7agz/screens/vendor_screens/admin_notifications.dart';
import 'package:Yalla7agz/providers/auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:Yalla7agz/screens/client_screens/home.dart';
import 'package:Yalla7agz/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Auth(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProxyProvider<Auth, Users>(
            create: (_) => Users(Provider.of<Auth>(context, listen: false).token,
                Provider.of<Auth>(context, listen: false).userId),
            update: (ctx, auth, user) =>
            user..receiveToken(auth),
          ),
          ChangeNotifierProxyProvider<Auth, Arenas>(
            create: (_) => Arenas(Provider.of<Auth>(context, listen: false).token,
                Provider.of<Auth>(context, listen: false).userId),
            update: (ctx, auth, arena) =>
            arena..receiveToken(auth),
          ),
          ChangeNotifierProxyProvider<Auth, Requests>(
            create: (_) => Requests(Provider.of<Auth>(context, listen: false).token,
                Provider.of<Auth>(context, listen: false).userId),
            update: (ctx, auth, request) =>
            request..receiveToken(auth),
          ),
        ],
        child: Consumer<Auth>(
            builder: (ctx, auth, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  '/login': (context) => Login(),
                  '/signUp': (context) => SignUp(),
                  '/home': (context) => Home(),
                  '/notification': (context) => Notifications(),
                  '/courtDetails': (context) => courtDetails(),
                  '/booking': (context) => bookingStatefulWidget(),
                  '/booked': (context) => booked(),
                  '/editProfile': (context) => editProfile(),
                  '/changePassword': (context) => changePassword(),
                  '/bookingDetails': (context) => bookingDetails(),
                  '/adminHome': (context) => adminHome(),
                  '/adminnotification': (context) => adminNotifications(),
                  '/forgotPassword': (context) => ForgetPassword(),
                  '/addArena': (context) => addArena(),
                  '/addCourt': (context) => addCourt(),
                },
                title: "Yalla 7agz",
                theme: ThemeData(primaryColor: Color(0xFF71A411)),
                home: auth.isAuth
                    ? auth.isClient?Home():adminHome(): Login())));
  }
}
