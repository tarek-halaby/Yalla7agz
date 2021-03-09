import 'dart:async';
import 'dart:convert';

import 'package:Yalla7agz/models/http_exception.dart';
import 'package:Yalla7agz/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userTokenId;
  String _userId;
  String _userName;
  String _email;
  bool _isClient;
  Timer _authTimer;

  bool get isClient => _isClient;

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  set isClient(bool value) {
    _isClient = value;
  }

  bool get isAuth {
    return token != null;
  }

  String get userTokenId {
    return _userTokenId;
  }

  String get userName {
    return _userName;
  }

  String get email {
    return _email;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> resetPassword(String email) async {
    final apiKey = "AIzaSyBiDI03OKL7D239ITTqxYizhxtXfKv24PQ";
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$apiKey';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "requestType":"PASSWORD_RESET",
            'email': email,
          },
        ),
      );
      final responseData = json.decode(response.body);
      print(response.statusCode);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    }catch (error) {
      throw error;
    }
  }
  Future<void> changePassword(String oldPass,String newPass)async{
    try {
    await  _authenticate(this._email, oldPass, 'signInWithPassword');
    final apiKey = "AIzaSyBiDI03OKL7D239ITTqxYizhxtXfKv24PQ";
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=$apiKey&&auth='+this.token;
      final response = await http.post(
        url,
        body: json.encode(
          {
            "idToken":this.token,
            "password":newPass,
            "returnSecureToken":true
          },
        ),
      );
      final responseData = json.decode(response.body);
    _token = responseData['idToken'];
    _userTokenId = responseData['localId'];
    if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    if (_userTokenId == null) {
      throw HttpException('User ID is null');
    }
    _expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ),
    );
    _autoLogout();
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'userTokenId': _userTokenId,
      'expiryDate': _expiryDate.toIso8601String(),
    });
    prefs.setString('User-Data', userData);
    }on HttpException catch(error){
  throw error;
  }
  }
  Future<void> _authenticate(
      String email, String password, String action) async {
    final apiKey = "AIzaSyBiDI03OKL7D239ITTqxYizhxtXfKv24PQ";
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$action?key=$apiKey';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException (responseData['error']['message']);
      }

      _token = responseData['idToken'];
      _userTokenId = responseData['localId'];

      _email = responseData['email'];
      _userName = _email.substring(0, _email.indexOf('@'));
      if (_userTokenId == null) {
        throw HttpException('User ID is null');
      }
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userTokenId': _userTokenId,
        'expiryDate': _expiryDate.toIso8601String(),
      });
      prefs.setString('User-Data', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password,String name,String mobilePhone,bool isClient) async {
    try{

      await _authenticate(email, password, 'signUp');
      String url="https://yalla7agz-default-rtdb.firebaseio.com/users.json?auth="+this.token;
    User user=new User(email,password,mobilePhone: mobilePhone ,name: name,isClient: isClient);
     final response=await http.post(url,
         body: user.toJson());
     final prefs = await SharedPreferences.getInstance();
    prefs.setString('UserId', json.decode(response.body)['name']);
      _userId=json.decode(response.body)['name'];
      this._isClient = isClient;
    notifyListeners();
     }on HttpException catch(error){
    throw error;
    }
  }

  Future<void> login(String email, String password) async {
    try{
        await  _authenticate(email, password, 'signInWithPassword');
          String url="https://yalla7agz-default-rtdb.firebaseio.com/users.json?auth="+this.token;
          final response= await http.get(url);
          final extractedData = json.decode(response.body) as Map<String, dynamic>;
          if (extractedData != null) {
            extractedData.forEach((userId, userData) async{
              if(userData['email']==email) {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('UserId', userId);
                this._userId=userId;
                if (userData["isClient"] == false) {

                  this._isClient = false;
                }
                else {
                  this._isClient = true;
                }
              }
            });

          notifyListeners();

        }}on HttpException catch(error){
          throw error;
        };
      }


  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('User-Data')) {
      return false;
    }
    final savedUserData =
    json.decode(prefs.getString('User-Data')) as Map<String, dynamic>;

    _expiryDate = DateTime.parse(savedUserData['expiryDate']);
    if (_expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    try {
      _token = savedUserData['token'];
      _userTokenId = savedUserData['userTokenId'];
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
    }
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _expiryDate = null;
    _userTokenId = null;
    _email = null;
    _userName = null;
    _userId=null;
    _authTimer?.cancel();

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    //final timeInSeconds = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(_expiryDate.difference(DateTime.now()), logout);
  }
}