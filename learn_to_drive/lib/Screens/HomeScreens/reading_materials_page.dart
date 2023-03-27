import 'package:first_app/Controllers/exam_paper_controller.dart';
import 'package:first_app/Models/exam_paper.dart';
import 'package:first_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingMaterialsPage extends StatelessWidget {
  ReadingMaterialsPage({super.key});

 final c = Get.put(ExamPaperController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'reading-materials'.tr,
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
      body:  Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  SizedBox(
                    height: Get.height - 140,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: c.examPapers.length,

                      itemBuilder: (context, index) {
                        ExamPaper examPaper =
                            c.examPapers[index];
                        return Text(examPaper.name??"",style: const TextStyle(color: Colors.white),);
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
