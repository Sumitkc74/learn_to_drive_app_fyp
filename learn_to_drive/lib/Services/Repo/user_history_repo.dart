import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/Models/user_history_model.dart';
import 'package:first_app/Services/globals.dart';

class UserHistoryRepo {
  static Future<http.Response> recordHistory(Map<String, List<String>> questionsList) async {
    Map<String, dynamic> data = {
      "user_id": currentUser.id,
      "attempted_questions": json.encode(questionsList['questions']),
      "optionA": json.encode(questionsList['option1']),
      "optionB": json.encode(questionsList['option2']),
      "optionC": json.encode(questionsList['option3']),
      "optionD": json.encode(questionsList['option4']),
      "correct_options": json.encode(questionsList['correctOption']),
      "selected_options": json.encode(questionsList['selectOption']),
    };

    var body = json.encode(data);
    var url = Uri.parse(userHistoryAPI);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    ); 
    return response;
  }
}

class GetUserHistoryRepo {
  static Future<void> getUserHistory(
      {required Function(List<UserHistory>) onSuccess,
      required Function(String message) onError}) async {
        
    try {
      var url = Uri.parse(userHistoryAPI);

      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);

      if (data['status']) {
        onSuccess(userHistoryFromJson(data['data']['userHistories']));
      }
    } catch (e) {
      log('-->>>>$e');
      onError('Sorry something went wrong. Please try again');
    }
  }
}