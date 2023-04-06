import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:first_app/Models/current_user_model.dart';
import 'package:first_app/Models/user_history_model.dart';
import 'package:first_app/Services/globals.dart';

class UserHistoryRepo {
  static Future<http.Response> recordHistory(Map<String, List<String>> questionsList) async {
    String jsonQuestionList = json.encode(questionsList['questions']);
    String jsonOption1List = json.encode(questionsList['option1']);
    String jsonOption2List = json.encode(questionsList['option2']);
    String jsonOption3List = json.encode(questionsList['option3']);
    String jsonOption4List = json.encode(questionsList['option4']);
    String jsonCorrectOptionList = json.encode(questionsList['correctOption']);
    String jsonSelectOptionList = json.encode(questionsList['selectOption']);
    // print(jsonQuestionList);
    // print(jsonOption1List);
    // print(jsonOption2List);
    // print(jsonOption3List);
    // print(jsonOption4List);
    // print(jsonCorrectOptionList);
    // print(jsonSelectOptionList);
    Map<String, dynamic> data = {
      "user_id": currentUser.id,
      "attempted_questions": jsonQuestionList,
      "optionA": jsonOption1List,
      "optionB": jsonOption2List,
      "optionC": jsonOption3List,
      "optionD": jsonOption4List,
      "correct_options": jsonCorrectOptionList,
      "selected_options": jsonSelectOptionList,
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