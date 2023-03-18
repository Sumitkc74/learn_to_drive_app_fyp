import 'package:first_app/Controllers/question_controller.dart';
import 'package:first_app/models/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MockExam extends StatefulWidget {
  const MockExam({super.key});

  @override
  State<MockExam> createState() => _MockExamState();
}

class _MockExamState extends State<MockExam> {

  final c = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mock Exam',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black, 
          ),
        ),
        toolbarHeight: 80,
        foregroundColor: const Color(0xff00183F),
        backgroundColor: const Color(0xFFFFDE17),
        shadowColor: const Color(0xff00183F),
      ),
      
      backgroundColor: const Color(0xFF303030),

      body:  Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: Get.height - 140,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: c.questions.length,

                      itemBuilder: (context, index) {
                        Question question =
                            c.questions[index];
                        return QuestionAnswer(ques: question);
                      },
                    ),
                  )
                ],
              ),
      ),

    );
  }
}


class QuestionAnswer extends StatefulWidget {
  const QuestionAnswer({
    super.key, required this.ques,
  });
  final Question ques;

  @override
  State<QuestionAnswer> createState() => _QuestionAnswerState();
}

class _QuestionAnswerState extends State<QuestionAnswer> {
  int userScore = 0;
  int currentQuestion = 0;

  void reset(){  
    userScore = 0;
    currentQuestion = 0;
  }

  void checkAnswer(String chosenOption){
    setState(() {
      if(widget.ques.correctOption == chosenOption){
        userScore++;
      }
      if(currentQuestion == 25){
        showDialog(context: context, builder:(context) => AlertDialog(
          title: const Text("Result"),
          content: Text('Your score is $userScore out of 25'),
          actions: [
            TextButton(onPressed: (){reset();}, child: const Text('Try Again!'))
          ],
        ));
        return;
      }
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          // Text("${widget.ques.id} out of ${widget.ques.length}"),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 100,
            width: double.infinity,
            child: Center(child: Text(widget.ques.question.toString(), style: const TextStyle(fontSize: 18, color: Colors.black))),
          ),
    
          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(widget.ques.option1.toString(), style: const TextStyle(fontSize: 15),),
            onPressed: () {
              checkAnswer('1');
            },
          ),

          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(widget.ques.option2.toString(), style: const TextStyle(fontSize: 15),),
            onPressed: () {
              checkAnswer('2');
            },
          ),

          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(widget.ques.option3.toString(), style: const TextStyle(fontSize: 15),),
            onPressed: () {
              checkAnswer('3');
              },
          ),

          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(widget.ques.option4.toString(), style: const TextStyle(fontSize: 15),),
            onPressed: () {
              checkAnswer('4');
            },
          ),
        ],
      ),
    );
  }
}