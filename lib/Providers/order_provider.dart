import 'package:chajrti/Constants/constants.dart';

import 'package:chajrti/Models/order.dart';
import 'package:flutter/material.dart';
class OrderProvider with ChangeNotifier {
   
   final List<Order> _orders = orders;
   List<Order> get  ordersList => _orders;

   void addTolist(Order order) {
    _orders.add(order); 
    notifyListeners();
   }
   
   void removeFromlist(Order order) {
    _orders.remove(order); 
    notifyListeners();
   }
}