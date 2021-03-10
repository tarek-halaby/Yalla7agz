import 'dart:convert';

import 'package:Yalla7agz/models/user_booking.dart';


class Request {
  String _id;
  UserBooking _userBooking;
  String _status;
  Request(status,userBooking,{id=null})
  {
    _id=id;
    _userBooking=userBooking;
    _status=status;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String toJson(){
    return json.encode({
      'status': this._status,
     "userId":this._userBooking.userId,
      'userBooking': {
    "totalPrice":this._userBooking.totalPrice,
     "courtId":this._userBooking.courtId,
     "arenaId":this._userBooking.arenaId,
     "date":this._userBooking.date,
     "from":this._userBooking.from,
     "to":this._userBooking.to,
      }
    });
  }

  UserBooking get userBooking => _userBooking;

  set userBooking(UserBooking value) {
    _userBooking = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }
}