import 'dart:convert';

import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/Services/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(String name, String email, String phoneNumber, String password) async {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
    };

    var body = json.encode(data);
    var url = Uri.parse(registerAPI);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );  
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(loginAPI);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }
  
  static Future<http.Response> changePassword(String currentPassword, String newPassword) async {
    Map data = {
      "email": currentUser.email,
      "password": currentPassword.trim(),
      "new_password": newPassword.trim(),
    };
    var body = json.encode(data);
    var url = Uri.parse(changePasswordAPI);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> resetPassword(String email) async {
    Map data = {
      "email": email,
    };
    var body = json.encode(data);
    var url = Uri.parse('${baseURL}auth/forgotPassword');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> logout() async {
    Map data = {

    };
    var body = json.encode(data);
    var url = Uri.parse(logoutAPI);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }
}