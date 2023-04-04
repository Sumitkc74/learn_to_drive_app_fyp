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
        : Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            itemCount: c.examPapers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 150,
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              ExamPaper examPaper = c.examPapers[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text(
                      examPaper.name??"",
                      style: const TextStyle(color: Colors.white),
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: examPaper.media!.length,
                      itemBuilder: (context,index){
                       Media media= examPaper.media![index];
                        return IconButton(onPressed: (){
                          c.launchInBrowser(media.originalUrl??"");
                        }, icon: const Icon(Icons.document_scanner_outlined), color: Colors.white,);
                      }
                    ),    
                  ],
                ),
              );
            }
          ),
        )
      )
    );
  }
}
