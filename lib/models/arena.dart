import 'dart:convert';

import 'package:Yalla7agz/models/country.dart';
import 'package:Yalla7agz/models/court.dart';

class Arena {
  String _id;
  String _name;
  Country _country;
  List<Court> courts;
  String _ownerId;

  Arena(name, {country = null,ownerId = null,id=null}) {
    _id = id;
    _name = name;
    _country = country;
    _ownerId = ownerId;
    courts=new List<Court>();
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String toJson() {
    return json.encode({
      'ownerId': this._ownerId,
      'name': this._name,
      'courts': {},
      'country': {
        "name": this._country.name,
        "city": {
          "name": this._country.city.name,
          "region": {
            "name": this._country.city.region.name,
            "address": {
              "latitude":this._country.city.region.address.lat,
              "longitude":this._country.city.region.address.long
            },
          },
        },
      },
    });
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Country get country => _country;

  set country(Country value) {
    _country = value;
  }

  String get ownerId => _ownerId;

  set ownerId(String value) {
    _ownerId = value;
  }
}
