import 'package:Yalla7agz/models/city.dart';

class Country {
  String _name;
  City _city;
  Country(name,{city=null})
  {
    _name=name;
    _city=city;
  }

  City get city => _city;

  set city(City value) {
    _city = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}