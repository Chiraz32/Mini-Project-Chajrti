import 'dart:convert';
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Models/favoris.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Constants/api_urls.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Plant> _plants = [];
  List<Plant> get myPlants => _plants;
  late Plant newPlant;
  final List<Favorite> favourites =[];
  List <Favorite> get myFav => favourites;
  int idFavoris = 0;
  Future<List<Plant>> getAllPlants(String token) async {
    final response = await http
        .get( Uri.http(ApiUrls.baseURL, ApiUrls.getPlants), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode((response.body.toString()));
    if (response.statusCode == 200) {
      _plants.clear();
      for (Map<String, dynamic> i in data) {
        //debugPrint(i.toString());
        _plants.add(Plant.fromJson(i));
      }
    }
    return _plants;
  }

  Future<Plant>getPlant(int id,String token) async {
    final response = await http
        .get(new Uri.http(ApiUrls.baseURL, "${ApiUrls.getPlant}$id"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode((response.body.toString()));
    //  debugPrint("dataValue is "+data.toString());
    if (response.statusCode == 200) {
     {
        
        newPlant =Plant.fromJson(data);
        debugPrint(newPlant.toJson().toString());
      }
    }
    
    return newPlant;}
  
  Future addPlant(BuildContext context, String name, String description,
      String price, String token) async {
    debugPrint("starting add");
    var dataInput = {
      "name": name,
      "image": "",
      "price": price,
      "description": description,
      "client": "",
    };
    final response = await http.post(
       Uri.http(ApiUrls.baseURL, ApiUrls.addPlant),
      body: dataInput,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    debugPrint("response is : ${response.body}");
    debugPrint("response  code is : ${response.statusCode}");

    if (response.statusCode == 201) {
      debugPrint(response.body);
      //return Plant.fromJson(json.decode(response.body));
    } else {
      throw Exception("something went wrong");
    }
    notifyListeners();
  }

  Future<List<Favorite>> getAllFavoris(String token) async {
    final response = await http
        .get(new Uri.http(ApiUrls.baseURL, ApiUrls.getFavoris), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode((response.body.toString()));
    // debugPrint(data.toString());
    if (response.statusCode == 200) {
      favourites.clear();
      // debugPrint("list of favourites ");
      for (Map<String, dynamic> i in data) {
       // debugPrint("favourite  is "+i.toString());
       
        favourites.add( Favorite.fromJson(i));
      }
    }
    return favourites;
  }

  Future addFavoris(Plant plant, String token) async {
    debugPrint("starting add");
    var dataInput = {
      "client": "",
      "plant": plant.id.toString(),
      
    };
    //  debugPrint("dataInput is $dataInput");
    final response = await http.post(
       Uri.http(ApiUrls.baseURL, ApiUrls.addFavoris),
      body: dataInput,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    // debugPrint("response is : ${response.body}");
    // debugPrint("response  code is : ${response.statusCode}");

    if (response.statusCode == 201) {
      debugPrint(response.body);
      //return Plant.fromJson(json.decode(response.body));
    } else {
      throw Exception("something went wrong");
    }
    notifyListeners();
  }
  
  bool findFavorisByPlant(Plant plant){
     for (Favorite i in favourites)
     {
      if (i.plant.id == plant.id)
       {idFavoris=i.id;
       //debugPrint("favoris found" + i.toJson().toString());
        return true;}
     }
     return false;
   }

  Future deleteFavoris(Plant plant, String token) async {
   if (findFavorisByPlant(plant)){
  //  debugPrint("id is : "+ idFavoris.toString());
    final res = await http.delete(
        Uri.http(ApiUrls.baseURL,"${ApiUrls.deleteFavoris}$idFavoris"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    // debugPrint(res.body);
    // debugPrint(res.statusCode.toString());
    if (res.statusCode == 200) {
      debugPrint("Deleted");
    }
     }
    
    else {
      throw "Sorry! Unable to delete this post.";
    }
      notifyListeners();
  }

}
