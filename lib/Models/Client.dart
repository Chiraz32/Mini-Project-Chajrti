import 'dart:convert';

List<Client> plantFromJson(String str) =>
    List<Client>.from(json.decode(str).map((x) => Client.fromJson(x)));

String plantToJson(List<Client> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Client {
  late int id;
  late String name;
  late String email;
  late String? image;
  late String password;
  late String salt;
  late int? phone;
  late String role;
  Client({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.salt,
    required this.role,
    this.phone,
    this.image
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"] ?? "default.png",
        password: json["password"] ?? "",
        salt: json["salt"] ?? "",
        phone: json["phone"],
        role: json["role"] ?? "",

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "password": password,
        "salt": salt,
        "phone": phone,
        "role": role
      };
}
