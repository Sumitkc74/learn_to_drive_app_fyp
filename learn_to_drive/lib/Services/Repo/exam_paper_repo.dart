import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:first_app/Services/globals.dart';
import 'package:first_app/Models/exam_paper_model.dart';

class ExamPaperRepo {
  static Future<void> getExamPaper(
      {required Function(List<ExamPaper>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse(examPaperAPI);

      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);
      if (data['status']) {
        onSuccess(examPaperFromJson(data['data']['examPapers']));
      }
    } catch (e) {
      log('-->>>>$e');
      onError('Sorry something went wrong. Please try again');
    }
  }
}
