class Client {
  late int id;
  late String name;
  late String? image;
  late String password;
  late int? phone;
  late String role;
  Client({
    required this.id,
    required this.name,
    required this.password,
    required this.role,
    this.phone,
    this.image
  });
}
