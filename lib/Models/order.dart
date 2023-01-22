import 'dart:convert';
import 'package:chajrti/Models/Client.dart';
import 'package:chajrti/Models/Plant.dart';
import 'package:chajrti/enum/OrderStateEnum.dart';
List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  late int id;
  late OrderStateEnum state;
  late Client client;
  late Plant plant;


  Order(
      {required this.id,
      required this.state,
      required this.client,
      required this.plant});


  factory Order.fromJson(Map<String, dynamic> json) => Order(
      id: json["id"],
      state: json["name"],
      client: json["image"],
      plant: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": state,
        "image": client,
        "description": plant,
      };
}

