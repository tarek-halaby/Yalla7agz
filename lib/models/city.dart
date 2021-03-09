import 'package:Yalla7agz/models/region.dart';

class  City{
  String _name;
  Region _region;
  City(name,{region=null})
  {
    _name=name;
    _region=region;
  }

  Region get region => _region;

  set region(Region value) {
    _region = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}