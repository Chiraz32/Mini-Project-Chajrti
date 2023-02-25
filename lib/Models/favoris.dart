import 'dart:convert';
import 'package:chajrti/Models/Client.dart';
import 'package:chajrti/Models/Plant.dart';

List<Favorite> favoriteFromJson(String str) =>
    List<Favorite>.from(json.decode(str).map((x) => Favorite.fromJson(x)));

String favoriteToJson(List<Favorite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Favorite {
  late int id;
  Client client;
  Plant plant;

  Favorite(
      {required this.id,
      required this.plant,
      required this.client});

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
      id: json["id"],
      client : Client.fromJson(json["client"]),
      plant: Plant.fromJson(json["plant"]),
  );
  Map<String, dynamic> toJson() => {
        "id": id,
        "client": client.toJson(),
        "plant": plant.toJson(),
      };
}
