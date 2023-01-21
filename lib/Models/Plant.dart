import 'dart:convert';

List<Plant> plantFromJson(String str) =>
    List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

String plantToJson(List<Plant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plant {
  late int id;
  late String name;
  late String? image;
  late String description;
  late int price;

  Plant(
      {required this.id,
      required this.name,
      this.image,
      required this.description,
      required this.price});

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      description: json["description"],
      price: json["price"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
      };
}
