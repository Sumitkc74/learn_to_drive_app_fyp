import 'dart:async';
import 'package:first_app/Controllers/question_controller.dart';
import 'package:first_app/Screens/HomeScreens/mock_exam_answer_page.dart';
import 'package:first_app/Screens/navigator.dart';
import 'package:first_app/Services/Repo/question_repo.dart';
import 'package:first_app/Models/question.dart';
import 'package:first_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MockExam extends StatefulWidget {
  const MockExam({super.key});

  @override
  State<MockExam> createState() => _MockExamState();
}

class _MockExamState extends State<MockExam> {

  final c = Get.put(QuestionController());
  List<Question> questions = [];
  int userScore=0, currentQuestion=1;
  int seconds = 20, minutes = 00;
  String digitSeconds = "20", digitMinutes = "00";
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
      seconds = 20;
      minutes = 00;
      digitSeconds = "20";
      digitMinutes = "00";
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
      if(currentQuestion == 8){
        endQuiz();
      }
      currentQuestion++;
    });
  }

  void getQuestion(){
    QuestionRepo.getQuestion(onSuccess: (question){
      questions = question..shuffle();
      // setState(() { });
    }, onError: (onError){});
  }

  void resetQuiz(){
    getQuestion();
    resetResult();
    resetTimer();
    startTimer();
  }

  Future<void> showStartDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('mock-exam'.tr, style: const TextStyle(color: Colors.white),),
          backgroundColor: AppColors.secondaryBlack,
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.', style: TextStyle(color: Colors.white),),
                Text('Would you start the mock exam?', style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Go Back', style: TextStyle(color: Colors.white),),
              onPressed: () {
                Get.off(const NavigationPage());
              }, 
            ),
            TextButton(
              child: const Text('Start', style: TextStyle(color: Colors.white),),
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
          title: const Text("Result", style: TextStyle(color: Colors.white),),
          content: Text(
            'Your score is $userScore out of 25', 
            style: const TextStyle(color: Colors.white),
          ),
          actions:  <Widget>[
            TextButton(
              child: const Text('View Answer', style: TextStyle(color: Colors.white),),
              onPressed: () {
                stopTimer();
                Get.to(() => const MockExamAnswer());
              }, 
            ),

            TextButton(
              child: const Text('Try Again', style: TextStyle(color: Colors.white),),
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
      appBar: AppBar(
        title: Text(
          'mock-exam'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black, 
          ),
        ),
        toolbarHeight: 80,
        foregroundColor: AppColors.primaryBlack,
        backgroundColor: AppColors.primaryYellow,
        shadowColor: AppColors.primaryBlack,
        actions: [
          IconButton(
            onPressed: () {
              resetQuiz();
            },
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
      
      backgroundColor: AppColors.secondaryBlack,

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
                          color : Colors.white, 
                          fontSize : 30.0, 
                          fontWeight : FontWeight.bold,
                        )
                      )
                    ),
                    const SizedBox(height: 25,),
                    
                    Text(
                      "$currentQuestion out of 25", 
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 25,),

                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 100,
                      width: double.infinity,
                      child: Center(child: Text("$currentQuestion. ${question.first.question}", style: const TextStyle(fontSize: 18, color: Colors.black))),
                    ),
              
                    MaterialButton(
                      color: Colors.blue,
                      minWidth: double.infinity,
                      child: Text('A. ${question.first.option1}', style: const TextStyle(fontSize: 15),),
                      onPressed: () {  
                        question.first.selectOption = question.first.option1;
                        checkAnswer(question.first.correctOption.toString(),'1');
                      },
                    ),

                    MaterialButton(
                      color: Colors.blue,
                      minWidth: double.infinity,
                      child: Text('B. ${question.first.option2}', style: const TextStyle(fontSize: 15),),
                      onPressed: () {
                        question.first.selectOption = question.first.option2;
                        checkAnswer(question.first.correctOption.toString(),'2');
                      },
                    ),

                    MaterialButton(
                      color: Colors.blue,
                      minWidth: double.infinity,
                      child: Text('C. ${question.first.option3}', style: const TextStyle(fontSize: 15),),
                      onPressed: () {
                        question.first.selectOption = question.first.option3;
                        checkAnswer(question.first.correctOption.toString(),'3');
                      },
                    ),

                    MaterialButton(
                      color: Colors.blue,
                      minWidth: double.infinity,
                      child: Text('D. ${question.first.option4}', style: const TextStyle(fontSize: 15),),
                      onPressed: () {
                        question.first.selectOption = question.first.option4;
                        checkAnswer(question.first.correctOption.toString(),'4');
                      },
                    ),
                  ]
                )
              ),
            )
          ],
        )
      :const CircularProgressIndicator()
    );
  }
}