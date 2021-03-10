import 'dart:convert';


class UserBooking {

  String _id;
  String _totalPrice;
  String _userId;
  String _courtId;
  String _arenaId;
  String _date;
  String _from;
  String _to;
  UserBooking(this._totalPrice,this._userId,this._courtId,this._arenaId,this._from,this._to,this._date);

  String get arenaId => _arenaId;

  set arenaId(String value) {
    _arenaId = value;
  }

  String get to => _to;

  set to(String value) {
    _to = value;
  }

  String get from => _from;

  set from(String value) {
    _from = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get courtId => _courtId;

  set courtId(String value) {
    _courtId = value;
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  String get totalPrice => _totalPrice;

  set totalPrice(String value) {
    _totalPrice = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}