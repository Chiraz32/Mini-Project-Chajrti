import 'package:chajrti/Constants/constants.dart';
import 'package:chajrti/Models/Plant.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  
  final List<Plant> _plants = plants;
  List<Plant> get myPlants => _plants;

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
}
