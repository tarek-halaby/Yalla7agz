import 'dart:convert';
import 'dart:io';

import 'package:Yalla7agz/models/address.dart';
import 'package:Yalla7agz/models/arena.dart';
import 'package:Yalla7agz/models/city.dart';
import 'package:Yalla7agz/models/country.dart';
import 'package:Yalla7agz/models/court.dart';
import 'package:Yalla7agz/models/court_type.dart';
import 'package:Yalla7agz/models/region.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Yalla7agz/providers/auth.dart';

class Arenas with ChangeNotifier {
  Arena _arena ;
  List<Arena> _arenas ;
  String authToken;
  String userId;
  Arenas(this.authToken, this.userId);

  List<Arena> get arenas => _arenas;

  set arenas(List<Arena> value) {
    _arenas = value;
  }

  Arena get arena => _arena;

  set arena(Arena value) {
    _arena = value;
  }
  Future<void> addArena(name,country,city,region,lat,long)async{
    Arena arena=new Arena(name,ownerId:this.userId,country:Country(country,city:City(city,region:Region(region,address: Address(lat,long)))));
    String url="https://yalla7agz-default-rtdb.firebaseio.com/arenas.json?auth=$authToken";
    final response=await http.post(url,
        body: arena.toJson());
    this.arena=arena;
    notifyListeners();
  }
  Future<void> addCourt(number,price,type,maxPlayers,arenaId)async{
    final arenaIndex = _arenas.indexWhere((arena) => arena.id == arenaId);
    String url="https://yalla7agz-default-rtdb.firebaseio.com/arenas/$arenaId/courts.json?auth=$authToken";
    final response=await http.post(url,
        body: json.encode({
            "number":number,
            "pricePerHour":price,
            "courtType":{
              "type":type,
              "maxPlayers":maxPlayers,
          }
        }));
    Court court=new Court(number,price,courtType: CourtType(type,maxPlayers));
    this.arenas[arenaIndex].courts.add(court);
    notifyListeners();
  }
  getCourts(arenaId)async{
    final arenaIndex = _arenas.indexWhere((arena) => arena.id == arenaId);

    var url = 'https://yalla7agz-default-rtdb.firebaseio.com/arenas/$arenaId/courts.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      final List<Court> loadedCourts = [];
      extractedData.forEach((courtId, courtData) {
        Court court=new Court(courtData['number'],courtData['pricePerHour'],id: courtId,courtType: CourtType(courtData['courtType']['type'],courtData['courtType']['maxPlayers']));
        loadedCourts.add(court);
      });
        this._arenas[arenaIndex].courts=loadedCourts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
   getArenas()async {
    final filterString ='orderBy="ownerId"&equalTo="$userId"';

    var url = 'https://yalla7agz-default-rtdb.firebaseio.com/arenas.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      final List<Arena> loadedArenas = [];
      extractedData.forEach((arenaId, arenaData) {
        Address address=new Address(arenaData['country']['city']['region']['address']['latitude'],arenaData['country']['city']['region']['address']['longitude']);
        Region region=new Region(arenaData['country']['city']['region']['name'],address: address);
        City city=new City(arenaData['country']['city']['name'],region: region);
        Country country=new Country(arenaData['country']['name'],city:city);
        Arena arena=new Arena(arenaData['name'],id: arenaId.toString(),country: country,);
        arena.id=arenaId;
        loadedArenas.add(arena);
      });

      _arenas = loadedArenas;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
    void receiveToken(Auth auth) {
    authToken = auth.token;
    userId = auth.userId;
  }
}