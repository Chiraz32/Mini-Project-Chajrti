import 'package:chajrti/Models/Client.dart';
import 'package:chajrti/enum/user_role_enum.dart';
import 'package:chajrti/Constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class UserProvider with ChangeNotifier {
  Client _user = Client(
      id: 0,
      email: "",
      name: "",
      mdp: "",
      salt: "",
      role: UserRoleEnum.admin,
      token: "");
  String loggedInStatus = "";

  Client get user => _user;
  void setUser(Client user) {
    _user = user;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(String email, String mdp) async {
    Map<String, dynamic> result;
    Map data = {'email': email, 'mdp': mdp};
    loggedInStatus = "Authenticating";
    final response = await http.post(
        Uri.http(ApiUrls.baseURL, ApiUrls.login),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var token = responseData['accessToken'];
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      payload.addAll({'token':token});
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

  Future<Map<String, dynamic>> getInfo(int id) async {
    final response = await http.get(Uri.http(ApiUrls.baseURL, '/client/${id}'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      debugPrint(responseData.toString());
      Client authUser = Client.fromJson(responseData);
      return {'status': true, 'message': 'successful', 'user': authUser};
    } else {
      return {
        'status': false,
        'message': json.decode(response.body)['message']
      };
    }
  }
    
}
