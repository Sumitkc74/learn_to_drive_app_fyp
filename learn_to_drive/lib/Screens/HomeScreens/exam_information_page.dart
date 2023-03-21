import 'package:first_app/Controllers/exam_information_controller.dart';
import 'package:first_app/Models/exam_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamInformationPage extends StatelessWidget {
  ExamInformationPage({super.key});

  final c = Get.put(ExamInformationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'exam-trial-information'.tr,
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
      body:  Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: Get.height - 140,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: c.examInformations.length,

                      itemBuilder: (context, index) {
                        ExamInformation examInformation =
                            c.examInformations[index];
                        return Text(examInformation.name??"",style: const TextStyle(color: Colors.white),);
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}