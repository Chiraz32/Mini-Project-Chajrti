import 'dart:convert';
import 'package:chajrti/Models/Client.dart';
import 'package:chajrti/enum/user_role_enum.dart';

List<Plant> plantFromJson(String str) =>
    List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

String plantToJson(List<Plant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plant {
  late int id;
  late String name;
  late String image;
  late String description;
  late int price;
  late Client client;

  Plant(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
       required this.client});

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      description: json["description"],
      price: json["price"],
      client: Client.fromJson(json["client"]?? {"id": 0, "name": "", "email": "@gmail.com", "mdp": "8WNOC", "salt": "2b", "image": "default.png", "phoneNumber": 0, "role": "buyer"})
      
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "client": client.toJson()
      };
}
