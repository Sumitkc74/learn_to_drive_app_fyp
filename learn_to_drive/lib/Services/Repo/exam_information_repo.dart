import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:first_app/Services/globals.dart';
import 'package:first_app/Models/exam_information_model.dart';

class ExamInformationRepo {
  static Future<void> getExamInformation(
      {required Function(List<ExamInformation>) onSuccess,
      required Function(String message) onError}) async {
    try {     
      var url = Uri.parse(examInformationAPI);

      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);
      if (data['status']) {
        onSuccess(examInformationFromJson(data['data']['examInformations']));
      }
    } catch (e) {
      log('-->>>>$e');
      onError('Sorry something went wrong. Please try again');
    }
  }
}
