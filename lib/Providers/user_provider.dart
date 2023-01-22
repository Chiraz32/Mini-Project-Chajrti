import 'package:chajrti/Models/Client.dart';
import 'package:chajrti/enum/user_role_enum.dart';
import 'package:chajrti/Constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Constants/api_urls.dart';
import 'package:jwt_decode/jwt_decode.dart';

class UserProvider with ChangeNotifier {
  Client _user = Client(
    id: 0,
    email: "",
    name: "",
    mdp: "",
    salt: "",
    role: UserRoleEnum.admin,
  );
  String loggedInStatus = "";

  Client get user => _user;
  void setUser(Client user) {
    _user = user;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(String email, String mdp) async {
    var result;
    Map data = {'email': email, 'mdp': mdp};
    loggedInStatus = "Authenticating";
    final response = await http.post(
        new Uri.http(ApiUrls.baseURL, ApiUrls.login),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      debugPrint(responseData.toString());
      var token = responseData['accessToken'];
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      debugPrint(payload.toString());
      Client authUser = Client.fromJson(payload);
      loggedInStatus = "LoggedIn";
      notifyListeners();
      result = {'status': true, 'message': 'successful', 'user': authUser};
    } else {
      loggedInStatus = "NotLoggedIn";
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message']
      };
    }
    return result;
  }
}
