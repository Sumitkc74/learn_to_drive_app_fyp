import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:first_app/Models/tutorial_model.dart';
import 'package:first_app/Services/globals.dart';

class TutorialRepo {
  static Future<void> getTutorial(
      {required Function(List<Tutorial>) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse(tutorialAPI);

      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);

      if (data['status']) {
        onSuccess(tutorialFromJson(data['data']['tutorials']));
      }
    } catch (e) {
      log('-->>>>$e');
      onError('Sorry something went wrong. Please try again');
    }
  }
}
