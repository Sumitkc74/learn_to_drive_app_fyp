import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Screens/HomeScreens/mock_exam_answer_page.dart';
import 'package:first_app/Screens/navigator.dart';
// import 'package:first_app/Controllers/question_controller.dart';
import 'package:first_app/Services/repo/question_repo.dart';
import 'package:first_app/Models/question_model.dart';
import 'package:first_app/utils/colors.dart';
import 'package:first_app/utils/widgets/button_widget.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';

class MockExam extends StatefulWidget {
  const MockExam({super.key});

  @override
  State<MockExam> createState() => _MockExamState();
}

class _MockExamState extends State<MockExam> {
  // final c = Get.put(QuestionController());
  List<Question> questions = [];
  int userScore=0, currentQuestion=1;
  static const int startingSeconds=0, startingMinutes = 30;
  static int seconds = startingSeconds, minutes = startingMinutes;
  static String digitSeconds = (startingSeconds >= 10) ? '$seconds': '0$startingSeconds';
  static String digitMinutes = (startingMinutes >= 10) ? '$minutes': '0$startingMinutes';
  Timer? timer;
  bool started = false;

  //Creating the timer stop function
  void stopTimer() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //creating the timer reset function 
  void resetTimer() {
    timer!.cancel();
    setState ((){
      seconds = startingSeconds;
      minutes = startingMinutes;
      digitSeconds = (startingSeconds >= 10) ? '$seconds': '0$startingSeconds';
      digitMinutes = (startingMinutes >= 10) ? '$minutes': '0$startingMinutes';
    });
  }

  endQuiz(){
    stopTimer();
    showResultDialog(context);
  }

  //creating the start timer function
  void startTimer() {
    started = true;
    timer = Timer.periodic (const Duration(seconds: 1), (timer) {
      int localSeconds= seconds - 1;
      int localMinutes = minutes;
      if(localMinutes == 0 && localSeconds == 0){
        endQuiz();
      }
      if (localSeconds < 0) {
        localMinutes--;
        localSeconds = 59;
      }
      setState(() {
        seconds=localSeconds;
        minutes = localMinutes;
        digitSeconds= (seconds >= 10) ? "$seconds": "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes": "0$minutes";
      });
    });
  }

  void resetResult(){  
    setState(() {
      userScore = 0;
      currentQuestion = 1;
    });
  }

  void checkAnswer(String correctOption, String chosenOption){
    setState(() {
      if(correctOption == chosenOption){
        userScore++;
      }
      if(currentQuestion == 25){
        endQuiz();
      }
      currentQuestion++;
    });
  }

  void getQuestion(){
    QuestionRepo.getQuestion(onSuccess: (question){
      questions = question..shuffle();
      questions = questions.sublist(0, 25);
      attemptedQuestions = questions;
    }, onError: (onError){});
  }

  void resetQuiz(){
    getQuestion();
    resetResult();
    resetTimer();
    startTimer();
  }

  showStartDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('mock-exam'.tr, style: const TextStyle(color: Colors.white),),
          backgroundColor: AppColors.secondaryBlack,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('mock-exam-instruction'.tr, style: const TextStyle(color: Colors.white),),
                Text('start-mock-exam'.tr, style: const TextStyle(color: Colors.white),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('go-back'.tr, style: const TextStyle(color: Colors.white),),
              onPressed: () {
                Get.off(() => const NavigationPage());
              }, 
            ),
            TextButton(
              child: Text('start'.tr, style: const TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
                startTimer();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showResultDialog(context) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.secondaryBlack,
          title: Text("result".tr, style: const TextStyle(color: Colors.white),),
          content: Text(
            'Your score is $userScore out of 25', 
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions:  <Widget>[
            TextButton(
              child: Text('view-answer'.tr, style: const TextStyle(color: Colors.white),),
              onPressed: () {
                stopTimer();
                Get.to(() => MockExamAnswer());
              }, 
            ),
            TextButton(
              child: Text('try-again'.tr, style: const TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pop(context);
                resetQuiz();
              }, 
            )
          ],
        );
      }
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showStartDialog(context);
    });
    getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    List<Question> question = (questions.where((element) => element.selectOption == null,).toList());

    return Scaffold(
      appBar: ScreensAppBar(
        title: 'mock-exam'.tr, 
        onPressed: () {
          endQuiz();
          Get.off(() => const NavigationPage());
        },
        action: IconButton(
          onPressed: () {
            resetQuiz();
          },
          icon: const Icon(Icons.replay_outlined),
        ),
      ),

      body:question.isNotEmpty
      ? Column(
          children: [  
            SizedBox(  
              height: Get.height - 140,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Center( 
                      child : Text(
                        "$digitMinutes:$digitSeconds", 
                        style : const TextStyle( 
                          // color : Colors.white, 
                          fontSize : 30.0, 
                          fontWeight : FontWeight.bold,
                        )
                      )
                    ),
                    const SizedBox(height: 25,),
                    
                    Text(
                      "$currentQuestion out of 25", 
                    ),
                    const SizedBox(height: 25,),

                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 100,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "$currentQuestion. ${question.first.question}", 
                          style: const TextStyle(
                            fontSize: 18, 
                            color: Colors.black
                          )
                        )
                      ),
                    ),

                    QuestionOptionButtonWidget(
                      option: '${'A'.tr}. ${question.first.option1}',
                      onPressed: () {
                        question.first.selectOption = 'A';
                        checkAnswer(question.first.correctOption.toString(),'A');
                      }, 
                    ),

                    QuestionOptionButtonWidget(
                      option: '${'B'.tr}. ${question.first.option2}',
                      onPressed: () {
                        question.first.selectOption = 'B';
                        checkAnswer(question.first.correctOption.toString(),'B');
                      }, 
                    ),

                    QuestionOptionButtonWidget(
                      option: '${'C'.tr}. ${question.first.option3}',
                      onPressed: () {
                        question.first.selectOption = 'C';
                        checkAnswer(question.first.correctOption.toString(),'C');
                      }, 
                    ),

                    QuestionOptionButtonWidget(
                      option: '${'D'.tr}. ${question.first.option4}',
                      onPressed: () {
                        question.first.selectOption = 'D';
                        checkAnswer(question.first.correctOption.toString(),'D');
                      }, 
                    ),
                  ]
                )
              ),
            )
          ],
        )
      :const Center(child: CircularProgressIndicator())
    );
  }
}