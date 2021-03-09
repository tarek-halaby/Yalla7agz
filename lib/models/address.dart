import 'package:Yalla7agz/models/region.dart';

class  Address{
  String _lat;
  String _long;
  Address(lat,long)
  {
    _lat=lat;
    _long=long;
  }

  String get long => _long;

  set long(String value) {
    _long = value;
  }

  String get lat => _lat;

  set lat(String value) {
    _lat = value;
  }
}