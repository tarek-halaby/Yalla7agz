import 'package:Yalla7agz/models/address.dart';

class Region {
  String _name;
  Address _address;
  Region(name,{address=null})
  {
    _name=name;
    _address=address;
  }

  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}