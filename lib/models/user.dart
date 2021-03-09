import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  int _id;
  String _email;
  String _password;
  String _mobileNumber;
  String _Name;
  bool _isClient;
  User(email,password,{name=null,mobilePhone=null,isClient=null})
  {
    _isClient=isClient;
    _email=email;
    _password=password;
    _Name=name;
    _mobileNumber=mobilePhone;
  }
  bool getIsClient()
  {
    return _isClient;
  }
  String getName()
  {
    return _Name;
  }
  String getEmail()
  {
    return _email;
  }
  String getPassword()
  {
    return _password;
  }
  String getMobileNumber()
  {
    return _mobileNumber;
  }
  String toJson(){
    return json.encode({
      'email': this._email,
      'mobile_number': this._mobileNumber,
      'name': this._Name,
      'isClient': this._isClient,
    });
  }
}