import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Models/question_model.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';

import 'package:first_app/Screens/HomeScreens/mock_exam_page.dart';
import 'package:first_app/Screens/navigator.dart';

class MockExamAnswer extends StatelessWidget {
  const MockExamAnswer({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(
        title: "mock-exam-answer".tr, 
        onPressed: () {
          Get.off(() => const NavigationPage());
        },
        action: IconButton(
          onPressed: () {
            Get.off(() => const MockExam());
          },
          icon: const Icon(Icons.replay_outlined),
        ),
      ),
      
      // backgroundColor: const Color(0xFF303030),
      body:  SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width, 
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: attemptedQuestions.length - 1,
                  itemBuilder: (context,index){ 
                    // count++;
                    Question question = attemptedQuestions[index];
                    return  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              '. ${question.question}',
                              style: const TextStyle(
                                fontSize: 20
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${'A'.tr}.  ${question.option1}', style: const TextStyle(fontSize: 16)),
                                Text('${'B'.tr}.  ${question.option2}', style: const TextStyle(fontSize: 16)),
                                Text('${'C'.tr}.  ${question.option3}', style: const TextStyle(fontSize: 16)),
                                Text('${'D'.tr}.  ${question.option4}', style: const TextStyle(fontSize: 16)),
                                Text('${'correct-option'.tr} : ${question.correctOption}', style: const TextStyle(fontSize: 16)),
                                Text('${'selected-option'.tr} : ${question.selectOption?.tr}', style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}