import 'package:first_app/Controllers/exam_paper_controller.dart';
import 'package:first_app/models/exam_paper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingMaterialsPage extends StatelessWidget {
  ReadingMaterialsPage({super.key});

 final c = Get.put(ExamPaperController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reading Materials',
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
