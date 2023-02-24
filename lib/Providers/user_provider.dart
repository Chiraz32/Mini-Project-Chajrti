// import 'dart:html';

import 'dart:io';

import 'package:chajrti/Models/Client.dart';
import 'package:chajrti/enum/user_role_enum.dart';
import 'package:chajrti/Constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';

class UserProvider with ChangeNotifier {
  Client _user = Client(
      id: 0,
      email: "",
      name: "",
      mdp: "",
      salt: "",
      phoneNumber: "",
      role: UserRoleEnum.admin,
      token: "");
  String loggedInStatus = "";

  Client get user => _user;

  String? get token => null;
  void setUser(Client user) {
    _user = user;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(String email, String mdp) async {
    Map<String, dynamic> result;
    Map data = {'email': email, 'mdp': mdp};
    loggedInStatus = "Authenticating";
    final response = await http.post(Uri.http(ApiUrls.baseURL, ApiUrls.login),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var token = responseData['accessToken'];
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      payload.addAll({'token': token});
      Client authUser = Client.fromJson(payload);
      loggedInStatus = "LoggedIn";
      notifyListeners();
      result = {
        'status': true,
        'message': 'successful',
        'user': authUser,
        'token': token
      };
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

  Future<Map<String, dynamic>> register(
      String email, String mdp, String username, String phone) async {
    Map<String, dynamic> result;
    Map data = {
      'email': email,
      'mdp': mdp,
      'name': username,
      'phoneNumber': phone
    };
    loggedInStatus = "Authenticating";
    final response = await http.post(Uri.http(ApiUrls.baseURL, ApiUrls.inscrit),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      Client authUser = Client.fromJson(responseData);
      result = {'status': true, 'message': 'successful', 'user': authUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['message']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getInfo(int id, String? token) async {
    final response = await http.get(
      Uri.http(ApiUrls.baseURL, '/client/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      Client authUser = Client.fromJson(responseData);
      return {'status': true, 'message': 'successful', 'user': authUser};
    } else {
      return {
        'status': false,
        'message': json.decode(response.body)['message']
      };
    }
  }

  Future<Map<String, dynamic>> updateInfo(
      int id, Map data, String? token) async {
    final response = await http.patch(
      Uri.http(ApiUrls.baseURL, '/client/update/$id'),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    debugPrint("data elli tpe3thet : " + data.toString());
    debugPrint("data elli rajj3et : " + response.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      debugPrint("Response data : " + responseData.toString());
      Client authUser = Client.fromJson(responseData);
      debugPrint("phone fil response : " + authUser.phoneNumber.toString());
      return {'status': true, 'message': 'successful', 'user': authUser};
    } else {
      return {
        'status': false,
        'message': json.decode(response.body)['message']
      };
    }
  }

  // #############
  Future<Map<String, dynamic>?> uploadProfileImaje(int id,File image, String? token) async {
    var request = await http.MultipartRequest(
      'PATCH',
      Uri.http(ApiUrls.baseURL,'/client/update/${id}'),
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        image.path,
        // filename: image.path.split('/').last,
      ),
    );
    var response = await request.send();
    if (response.statusCode == 200) {
    //   // final Map<String, dynamic> responseData = json.decode(response);
    //   Client authUser = Client.fromJson(responseData);
    //   return {'status': true, 'message': 'successful', 'user': authUser};
    // } else {
    //   return {
    //     'status': false,
    //     'message': json.decode(response.body)['message']
    //   };
    }
    // ############
  }
  
}
