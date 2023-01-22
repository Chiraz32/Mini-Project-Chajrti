import 'dart:convert';
import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Screens/addPlant_seller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Constants/api_urls.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Plant> _plants = [];
  List<Plant> get myPlants => _plants;
  late Plant newPlant;

  final List<Plant> _fav = [];
  List<Plant> get myFav => _fav;

  void addToList(Plant plant) {
    _plants.add(plant);
    notifyListeners();
  }

  void removeFromList(Plant plant) {
    _plants.remove(plant);
    notifyListeners();
  }

  void addToFav(Plant plant) {
    _fav.add(plant);
    notifyListeners();
  }

  void removeFromFav(Plant plant) {
    _fav.remove(plant);
    notifyListeners();
  }
  
  AddPlant(context,name,description,price) async{
    newPlant= await postPlant(context,name,description,price);
    notifyListeners(); 
  }
   

  Future<List<Plant>> getAllPlants(String token) async {
    final response = await http
        .get(new Uri.http(ApiUrls.baseURL, ApiUrls.getPlants), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode((response.body.toString()));
    if (response.statusCode == 200) {
      _plants.clear();
      for (Map<String, dynamic> i in data) {
        debugPrint(i.toString());
        _plants.add(Plant.fromJson(i));
      }
    }
    return _plants;
  }
}
