import 'dart:convert';
import 'dart:developer';
import 'package:first_app/Services/globals.dart';
import 'package:first_app/models/question.dart';
import 'package:http/http.dart' as http;

class QuestionRepo {
  static Future<void> getQuestion(
      {required Function(List<Question>) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse("${baseURL}question");

      http.Response response = await http.get(
        url,
        headers: headers,
      );

      var data = json.decode(response.body);

      if (data['status']) {
        onSuccess(questionFromJson(data['data']['questions']));
      }

    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
