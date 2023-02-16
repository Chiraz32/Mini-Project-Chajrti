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
  
  AddPlant(context,name,description,price,token) async{
    newPlant= await postPlant(context,name,description,price,token);
    notifyListeners(); 
  }
   Future<Plant> postPlant(
    BuildContext context, String name, String description, String price,String token) async {
      debugPrint("starting add");
  var dataInput = {
    "name": name,
    "image": "",
    "price": price,
    "description": description,
    "client": "",
  };
  final response = await http.post(
      new Uri.http(ApiUrls.baseURL, ApiUrls.addPlant),
      body: dataInput,
      headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json',
      'Authorization': 'Bearer $token',},
      encoding: Encoding.getByName("utf-8"),);
      debugPrint("response is : "+ response.body.toString());
      debugPrint("response  code is : "+ response.statusCode.toString());

  if (response.statusCode == 201) {
    return Plant.fromJson(json.decode(response.body));
  } else {
    throw Exception("something went wrong");
  }
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

  AddPlant(context, name, description, price, token) async {
    await postPlant(context, name, description, price, token);
    notifyListeners();
  }

  Future postPlant(BuildContext context, String name, String description,
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
      new Uri.http(ApiUrls.baseURL, ApiUrls.addPlant),
      body: dataInput,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    debugPrint("response is : " + response.body.toString());
    debugPrint("response  code is : " + response.statusCode.toString());

    if (response.statusCode == 201) {
      debugPrint(response.body);
      //return Plant.fromJson(json.decode(response.body));
    } else {
      throw Exception("something went wrong");
    }
  }

// upload image
// Future<XFile?> image = ImagePicker.pickImage(source: ImageSource.gallery);
// final Future<Map<String, dynamic>?> editImage =
//     auth.uploadProfileImaje(auth.user.id, File(image!.path, image.name), auth.token);
// editImage.then((response) {
//   if (response["status"]) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditProfile(),
//       ),
//     );
//   } else {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Erreur",
//               style: TextStyle(
//                   color: mainGreen,
//                   fontFamily: defaultFontFamily,
//                   fontSize: 20)),
//           content: Text(response["message"]),
//           actions: [
//             TextButton(
//               child: Text("OK",
//                   style: TextStyle(
//                       color: mainGreen,
//                       fontFamily: defaultFontFamily,
//                       fontSize: 16)),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// });
//Navigator.of(context).pop();
}
