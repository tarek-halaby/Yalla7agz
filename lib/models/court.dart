import 'dart:convert';

import 'package:Yalla7agz/models/court_type.dart';
import 'package:Yalla7agz/screens/client_screens/courtDetails.dart';
import 'package:Yalla7agz/screens/client_screens/courtDetails.dart';

class Courts  {
  String _id;
  String _place;
  String _from;
  String _to;
  Courts(place,from,to)
  {
    _place=place;
    _from=from;
    _to=to;
  }
  String getPlace()
  {
    return _place;
  }
  String getFrom()
  {
    return _from;
  }
  String getTo()
  {
    return _to;
  }
//  void addCourt(Courts courte) async{
//    const url='https://yalla7agz-default-rtdb.firebaseio.com/courts.json';
//    try {
//      final response = await http.get(url);
//      //print(json.decode(response.body));
//      final dbData = json.decode(response.body) as Map<String, dynamic>;
//      final List<courtDetails> dbProducts = [];
//      dbData.forEach((key, data) {
//        dbProducts.add(Product(
//          id: key,
//          title: data['title'],
//          description: data['description'],
//          price: data['price'],
//          imageUrl: data['imageUrl'],
//          isFavorite: data['isFavorite'],
//        ));
//      });
//      _items = dbProducts;
//      notifyListeners();
//    } on Exception catch (e) {
//      print(e.toString());
//      throw (e);
//    }
//
//  }
}
class Court {
  String id;
  String _number;
  String _pricePerHour;
  CourtType courtType;

  Court(this._number, this._pricePerHour, {this.courtType, this.id});

  String get pricePerHour => _pricePerHour;

  set pricePerHour(String value) {
    _pricePerHour = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }
  String toJson(){
    return json.encode({
      'number': this._number,
      'pricePerHour': this._pricePerHour,
      'courtType':{
        "type":this.courtType.type,
        "maxPlayers":this.courtType.maxPlayers,
      }
    });
  }
}