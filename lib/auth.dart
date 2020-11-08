import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


class Auth {
  login() async
  {

    SharedPreferences pref= await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', true);
  }

}