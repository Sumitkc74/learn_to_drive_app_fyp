import 'dart:convert';
import 'dart:developer';
import 'package:first_app/Services/globals.dart';
import 'package:http/http.dart' as http;
import '../models/vision_test.dart';

class VisionTestRepo {
  static Future<void> getVisionTest(
      {required Function(List<VisionTest>) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse("${baseURL}visionTest");

      http.Response response = await http.get(
        url,
        headers: headers,
      );

      var data = json.decode(response.body);

      if (data['status']) {
        onSuccess(visionTestFromJson(data['data']['visionTests']));
      }

    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
