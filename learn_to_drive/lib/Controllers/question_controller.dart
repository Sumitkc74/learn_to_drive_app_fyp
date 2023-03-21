import 'dart:developer';
import 'package:first_app/Services/Repo/question_repo.dart';
import 'package:first_app/Models/question.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  final  questions = <Question>[];  
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllQuestions();
    super.onInit();
  }

  getAllQuestions() async {
    loading.value = true;
    await QuestionRepo.getQuestion(
      onSuccess: (question) {
        loading.value = false;

        questions.addAll(question);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
