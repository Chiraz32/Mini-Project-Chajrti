import 'dart:convert';
import 'package:chajrti/Constants/api_urls.dart';
import 'package:chajrti/Models/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class orderProvider with ChangeNotifier{
  List<Order> _orders = [];

  List<Order> get myOrders => _orders;


 Future<List<Order>> getAllOrders(String token) async {
    final response = await http
        .get(new Uri.http(ApiUrls.baseURL, ApiUrls.getOrders), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });


    var data = jsonDecode((response.body.toString()));
    if (response.statusCode == 201) {

      _orders.clear();
      for (Map<String, dynamic> i in data) {
        debugPrint(i.toString());
        _orders.add(Order.fromJson(i));
      }
    }
    return _orders;
  }
}