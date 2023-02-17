import 'dart:convert';

import 'package:chajrti/enum/user_role_enum.dart';

List<Client> clientFromJson(String str) =>
    List<Client>.from(json.decode(str).map((x) => Client.fromJson(x)));

String clientToJson(List<Client> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Client {
  late int id;
  late String name;
  late String email;
  late String? image;
  late String mdp;
  late String salt;
  late String phoneNumber;
  late UserRoleEnum role;
  String token;

  Client({
    required this.id,
    required this.email,
    required this.name,
    required this.mdp,
    required this.salt,
    required this.role,
    required this.phoneNumber,
    this.image,
    required this.token
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"] ?? "default.png",
        mdp: json["mdp"] ?? "",
        salt: json["salt"] ?? "",
        phoneNumber: json["phoneNumber"]?? "" ,
        role:json["role"] == "buyer" ? UserRoleEnum.buyer : UserRoleEnum.seller,
        token: json["token"]??""
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "mdp": mdp,
        "salt": salt,
        "phoneNumber": phoneNumber,
        "role": role,
        "token": token
      };
}
