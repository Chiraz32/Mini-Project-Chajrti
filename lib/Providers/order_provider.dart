import 'dart:convert';

import 'package:chajrti/Constants/api_urls.dart';
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/Models/order.dart';
import 'package:chajrti/enum/order_state_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OrderProvider with ChangeNotifier{
  final List<Order> _orders = [];
  List<Order> get myOrders => _orders;
  late Order newOrder;

  void addToList(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  void removeFromList(Order order) {
    _orders.remove(order);
    notifyListeners();
  }

 Future<List<Order>> getAllOrders(String token) async {
    final response = await http
        .get( Uri.http(ApiUrls.baseURL, ApiUrls.getOrders), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = jsonDecode((response.body.toString()));
    if (response.statusCode == 200) {
      _orders.clear();
      for (Map<String, dynamic> i in data) {
        debugPrint(i.toString());
        _orders.add(Order.fromJson(i));
      }
    }
    return _orders;
  }

   addOrder(context,Plant plant, token) async {
    await postOrder(context,plant, token);
    notifyListeners();
  }

  Future postOrder(BuildContext context,Plant plant,
   String token) async {
    debugPrint("starting add");
   // debugPrint(plant.client.toString());
    var dataInput = {
      "state": "pending",
      "client": "",
      "plant" : plant.id.toString(),
    };
    debugPrint("token is $token");
    debugPrint("dataInput is "+ dataInput.toString());
    
    final response = await http.post(
       Uri.http(ApiUrls.baseURL, ApiUrls.addOrder),
      body: dataInput,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
    );
    debugPrint("response request is : ${response.request}");
    debugPrint("response  code is : ${response.statusCode}");
     debugPrint("response  body is : ${response.body}");
    if (response.statusCode == 201) {
      debugPrint(response.body);}
      //return Plant.fromJson(json.decode(response.body));
     else {
      throw Exception("something went wrong");
    }
    }

     Future deleteOrder(int id,String token) async {
    debugPrint("$id");
    final res = await http
        .delete(new Uri.http(ApiUrls.baseURL, ApiUrls.deleteOrder + "$id"),
        headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    debugPrint(res.body);
    debugPrint(res.statusCode.toString());
    if (res.statusCode == 200) {
        debugPrint("Deleted");
    } else {
        throw "Sorry! Unable to delete this post.";
    }
  }
 
  }


