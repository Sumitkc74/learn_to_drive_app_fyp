import 'dart:convert';
import 'dart:developer';
import 'package:first_app/Services/globals.dart';
import 'package:first_app/models/exam_information.dart';
import 'package:http/http.dart' as http;

class ExamInformationRepo {
  static Future<void> getExamInformation(
      {required Function(List<ExamInformation>) onSuccess,
      required Function(String message) onError}) async {
    try {     
      var url = Uri.parse('${baseURL}examInformation');

      http.Response response = await http.get(
        url,
        headers: headers,
      );
      
      var data = json.decode(response.body);
      if (data['status']) {
        // log("--------------------------------${(data['data']['examInformations'])}");
        onSuccess(examInformationFromJson(data['data']['examInformations']));
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
