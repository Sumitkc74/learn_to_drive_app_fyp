import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:first_app/Models/question_model.dart';
import 'package:first_app/Models/user_history_model.dart';
import 'package:first_app/Services/repo/user_history_repo.dart';
import 'package:first_app/Screens/navigator.dart';

class UserHistoryController extends GetxController {
  var loading = false.obs;

    Future<Map<String, List<String>>> getAllQuestions() async {
    List<String> questions = [];
    List<String> option1 = [];
    List<String> option2 = [];
    List<String> option3 = [];
    List<String> option4 = [];
    List<String> correctOption = [];
    List<String> selectOption = [];

    for (var question in attemptedQuestions) {
        questions.add(question.question??'');
        option1.add(question.option1??'');
        option2.add(question.option2??'');
        option3.add(question.option3??'');
        option4.add(question.option4??'');
        correctOption.add(question.correctOption??'');
        selectOption.add(question.selectOption??'');
    }
    return {
      'questions': questions,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'correctOption': correctOption,
      'selectOption': selectOption,
    };
  }

  Map<String, List<String>> decodeAllLists(UserHistory userHistory){
    return {
      'questions': List<String>.from(json.decode(userHistory.attemptedQuestions??'[]')),
      'option1': List<String>.from(json.decode(userHistory.optionA??'[]')),
      'option2': List<String>.from(json.decode(userHistory.optionB??'[]')),
      'option3': List<String>.from(json.decode(userHistory.optionC??'[]')),
      'option4': List<String>.from(json.decode(userHistory.optionD??'[]')),
      'correct_options': List<String>.from(json.decode(userHistory.correctOptions??'[]')),
      'selected_options': List<String>.from(json.decode(userHistory.selectedOptions??'[]')),
    };
  }
  
  Future<void> recordUserHistory({required Map<String, List<String>> attemptedQuestions}) async {
      http.Response response = await UserHistoryRepo.recordHistory(attemptedQuestions);
      Map responseMap = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.off(() => const NavigationPage());
        Get.snackbar("Success", responseMap["message"]);
      } else {
        Get.snackbar("Failed", responseMap["message"]);
      }
  }
}

class GetUserHistoryController extends GetxController {
  final  userHistories = <UserHistory>[];  
  RxBool loading = false.obs;
  @override
  void onInit() {
    getUserHistories();
    super.onInit();
  }

  getUserHistories() async {
    loading.value = true;
    await GetUserHistoryRepo.getUserHistory(
      onSuccess: (userHistory) {
        loading.value = false;
        userHistories.addAll(userHistory);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
