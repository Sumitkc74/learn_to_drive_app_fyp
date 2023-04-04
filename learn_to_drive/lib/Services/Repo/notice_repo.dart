import 'dart:convert';
import 'dart:developer';

import 'package:first_app/Models/notice_model.dart';
import 'package:first_app/Services/globals.dart';
import 'package:http/http.dart' as http;

class NoticeRepo {
  static Future<void> getNotice(
      {required Function(List<Notice>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse(noticeAPI);

      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);
      
      if (data['status']) {
        onSuccess(noticeFromJson(data['data']['notices']));
      }
    } catch (e) {
      log('-->>>>$e');
      onError('Sorry something went wrong. Please try again');
    }
  }
}