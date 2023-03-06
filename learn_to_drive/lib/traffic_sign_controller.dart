import 'dart:convert';

import 'package:first_app/Services/globals.dart';
import 'package:http/http.dart' as http;

class TrafficSign {
  var url = Uri.parse('${baseURL}trafficSign');
  
  Future<List> getAllTrafficSign() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}