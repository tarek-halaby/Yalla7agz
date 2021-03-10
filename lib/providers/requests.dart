import 'dart:convert';
import 'dart:io';
import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/models/request.dart';
import 'package:Yalla7agz/models/user_booking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Yalla7agz/providers/auth.dart';

class Requests with ChangeNotifier {
  List<Request> _requests ;
  Request _request ;
  String authToken;
  String userId;
  Requests(this.authToken, this.userId);

  Request get user => _request;

  List<Request> get requests => _requests;

  set requests(List<Request> value) {
    _requests = value;
  }

  set user(Request value) {
    _request = value;
  }
  Future<void> book(arenaId,courtId,totalPrice,date,from,to)async{
    String url="https://yalla7agz-default-rtdb.firebaseio.com/requests.json?auth=$authToken";
    Request request=new Request('Pending', UserBooking(totalPrice,this.userId,courtId,arenaId,date,from,to));
    final response = await http.post(url,
    body: request.toJson());
    print(response.body);
    this._request=request;
    this._request.id=json.decode(response.body)['name'];
    this._requests.add(request);
    notifyListeners();
  }
  void receiveToken(Auth auth) {
    authToken = auth.token;
    userId = auth.userId;
  }
  getRequests()async {
    var url = 'https://yalla7agz-default-rtdb.firebaseio.com/requests.json?auth=$authToken&orderBy="userId"&equalTo="$userId"';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Request> loadedrequests = [];
      extractedData.forEach((requestId, requestData) {
        Request request=new Request(requestData['status'], UserBooking(requestData['userBooking']['totalPrice'],requestData['userId'],requestData['userBooking']['courtId'],requestData['userBooking']['arenaId'],requestData['userBooking']['date'],requestData['userBooking']['from'],requestData['userBooking']['to']));
        request.id=requestId;
        loadedrequests.add(request);
      });

      _requests = loadedrequests;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
  respondRequest(bool isAccept,String id)async {
    final url = 'https://yalla7agz-default-rtdb.firebaseio.com/requests/$id.json?auth=$authToken';
    final prodIndex = _requests.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      await http.patch(url,
          body: json.encode({
            'status': isAccept?"Accepted":"Declined",
          }));
      _requests[prodIndex].status = isAccept?"Accepted":"Declined";
      notifyListeners();
    } else {
      print('...');
    }
  }
  cancelReq(String id) async{
    final url = 'https://yalla7agz-default-rtdb.firebaseio.com/requests/$id.json?auth=$authToken';
    final existingProductIndex = _requests.indexWhere((prod) => prod.id == id);
    var existingProduct = _requests[existingProductIndex];
    _requests.removeAt(existingProductIndex);
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _requests.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
    notifyListeners();
  }

  getAdminRequests(List<Arena> arenas) async{
    var url = 'https://yalla7agz-default-rtdb.firebaseio.com/requests.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Request> loadedrequests = [];
      extractedData.forEach((requestId, requestData) {
        if(arenas.indexWhere((element) => element.id==requestData['userBooking']['arenaId'])!=-1)
          {
            Request request=new Request(requestData['status'], UserBooking(requestData['userBooking']['totalPrice'],requestData['userId'],requestData['userBooking']['courtId'],requestData['userBooking']['arenaId'],requestData['userBooking']['date'],requestData['userBooking']['from'],requestData['userBooking']['to']));
            request.id=requestId;
            loadedrequests.add(request);
          }
      });

      _requests = loadedrequests;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
