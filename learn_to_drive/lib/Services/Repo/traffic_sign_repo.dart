import 'dart:convert';
import 'dart:developer';
import 'package:first_app/Services/globals.dart';
import 'package:http/http.dart' as http;
import '../../Models/traffic_sign.dart';

class TrafficSignRepo {
  static Future<void> getTrafficSign(
      {required Function(List<TrafficSign>) onSuccess,
      required Function(String message) onError}) async {
    try {     
      var url = Uri.parse('${baseURL}trafficSign');
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);
      
      // print('----------->>>>>>>>>>$data');
      if (data['status']) {
        // print(trafficSignFromJson(data['data']['categories']));
        onSuccess(trafficSignFromJson(data['data']['categories']));
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
