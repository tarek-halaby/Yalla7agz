import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Yalla7agz/models/user.dart';
import 'package:Yalla7agz/providers/auth.dart';

class Users with ChangeNotifier {
  User _user ;
  String authToken;
  String userId;
  Users(this.authToken, this.userId);

  User get user => _user;

  set user(User value) {
    _user = value;
  }
  Future<void> getUser()async{
    String url="https://yalla7agz-default-rtdb.firebaseio.com/users/$userId.json?auth=$authToken";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    User user=new User(extractedData['email'],null,name: extractedData['name'],mobilePhone: extractedData['mobile_number'],isClient: extractedData['isClient']);
    this.user=user;
    notifyListeners();
  }
  void receiveToken(Auth auth) {
    authToken = auth.token;
    userId = auth.userId;
  }

  Future<void> updateProfile(String name, String mobile) async{
    String url="https://yalla7agz-default-rtdb.firebaseio.com/users/$userId.json?auth=$authToken";
    final response =await http.patch(url,
        body: json.encode({
          'name': name,
          'mobile_number': mobile,
        }));
    final responseData = json.decode(response.body);
    if (responseData['error'] != null) {
      throw HttpException (responseData['error']['message']);
    }
    notifyListeners();
  }
}