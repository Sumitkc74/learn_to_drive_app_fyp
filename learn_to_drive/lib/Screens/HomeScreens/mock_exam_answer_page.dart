import 'package:first_app/Screens/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MockExamAnswer extends StatefulWidget {
  const MockExamAnswer({super.key});

  @override
  State<MockExamAnswer> createState() => _MockExamAnswerState();
}

class _MockExamAnswerState extends State<MockExamAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.off(const NavigationPage());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "mock-exam-answer".tr,
          style: const TextStyle(
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
      body: Stack(
        
      ),
    );
  }
}