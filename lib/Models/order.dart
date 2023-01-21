import 'dart:convert';

import 'package:chajrti/enum/OrderStateEnum.dart';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  late int id;
  late OrderStateEnum state;
  late int clientId;
  late int plantId;

  Order(
      {required this.id,
      required this.state,
      required this.clientId,
      required this.plantId});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      id: json["id"],
      state: json["name"],
      clientId: json["image"],
      plantId: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": state,
        "image": clientId,
        "description": plantId,
      };
}
