import 'package:first_app/Controllers/question_controller.dart';
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
  List<Question> questions = [];
  int userScore=0;
  int currentQuestion=1;

  @override
  void initState() {
    super.initState();
    QuestionRepo.getQuestion(onSuccess: (question){
      questions = question;
      setState(() {
        
      });
    }, onError: (onError){});
  }

  void reset(){  
    userScore = 0;
    currentQuestion = 1;
  }

  void checkAnswer(String correctOption, String chosenOption){
    setState(() {
      if(correctOption == chosenOption){
        userScore++;
      }

      if(currentQuestion == 9){
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

  // final c = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
   List<Question> question = questions.where((element) => element.selectOption == null,).toList();

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
      ),
      
      backgroundColor: AppColors.secondaryBlack,

      body:question.isNotEmpty? Column(
                children: [  
                  SizedBox(  
                    height: Get.height - 140,
                    child: Padding(
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
            child: Center(child: Text("$currentQuestion. ${question.first.question}", style: const TextStyle(fontSize: 18, color: Colors.black))),
          ),
    
          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(question.first.option1.toString(), style: const TextStyle(fontSize: 15),),
            onPressed: () {  
              question.first.selectOption = question.first.option1;
              checkAnswer(question.first.correctOption.toString(),'1');
             
            },
          ),

          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(question.first.option2.toString(), style: const TextStyle(fontSize: 15),),
            onPressed: () {
               question.first.selectOption = question.first.option2;
              // setState(() {
                
              // });
              checkAnswer(question.first.correctOption.toString(),'2');
            },
          ),

          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(question.first.option3.toString(), style: const TextStyle(fontSize: 15),),
            onPressed: () {
              question.first.selectOption = question.first.option3;
              // setState(() {
                
              // });
              checkAnswer(question.first.correctOption.toString(),'3');
              },
          ),

          MaterialButton(
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(question.first.option4.toString(), style: const TextStyle(fontSize: 15),),
            onPressed: () {
             question.first.selectOption = question.first.option4;
            //   setState(() {
                
            //   });
              checkAnswer(question.first.correctOption.toString(),'4');
            },
          ),
        ],
      ),
    ),
   
                  )
                ],):const CircularProgressIndicator());
  }
}


// class QuestionAnswer extends StatefulWidget {
//   const QuestionAnswer({
//     super.key, required this.ques,
//   });
//   final Question ques;

//   @override
//   State<QuestionAnswer> createState() => _QuestionAnswerState();
// }

// class _QuestionAnswerState extends State<QuestionAnswer> {
//   int userScore = 0;
//   int currentQuestion = 0;

//   void reset(){  
//     userScore = 0;
//     currentQuestion = 0;
//   }

//   void checkAnswer(String chosenOption){
//     setState(() {
//       if(widget.ques.correctOption == chosenOption){
//         userScore++;
//       }
//       if(currentQuestion == 25){
//         showDialog(context: context, builder:(context) => AlertDialog(
//           title: const Text("Result"),
//           content: Text('Your score is $userScore out of 25'),
//           actions: [
//             TextButton(onPressed: (){reset();}, child: const Text('Try Again!'))
//           ],
//         ));
//         return;
//       }
//       currentQuestion++;
//     });
//   }
//   final c = Get.put(QuestionController());

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Column(
//         children: [
//           // Text("${widget.ques.id} out of ${widget.ques.length}"),
//           Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//             ),
//             height: 100,
//             width: double.infinity,
//             child: Center(child: Text(widget.ques.question.toString(), style: const TextStyle(fontSize: 18, color: Colors.black))),
//           ),
    
//           MaterialButton(
//             color: Colors.blue,
//             minWidth: double.infinity,
//             child: Text(widget.ques.option1.toString(), style: const TextStyle(fontSize: 15),),
//             onPressed: () {
//               c.questions.value.where((element) => element == widget.ques).first.correctOption  =widget.ques.option1 ;
//               setState(() {  
                
//               });
             
//             },
//           ),

//           MaterialButton(
//             color: Colors.blue,
//             minWidth: double.infinity,
//             child: Text(widget.ques.option2.toString(), style: const TextStyle(fontSize: 15),),
//             onPressed: () {
//               checkAnswer('2');
//             },
//           ),

//           MaterialButton(
//             color: Colors.blue,
//             minWidth: double.infinity,
//             child: Text(widget.ques.option3.toString(), style: const TextStyle(fontSize: 15),),
//             onPressed: () {
//               checkAnswer('3');
//               },
//           ),

//           MaterialButton(
//             color: Colors.blue,
//             minWidth: double.infinity,
//             child: Text(widget.ques.option4.toString(), style: const TextStyle(fontSize: 15),),
//             onPressed: () {
//               checkAnswer('4');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }