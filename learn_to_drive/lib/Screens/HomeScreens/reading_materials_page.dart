import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/utils/widgets/screens_app_bar.dart';
import 'package:first_app/Controllers/exam_paper_controller.dart';
import 'package:first_app/Models/exam_paper_model.dart';
import 'package:first_app/utils/pdf_reader.dart';

class ReadingMaterialsPage extends StatelessWidget {
  ReadingMaterialsPage({super.key});

 final readingMaterialController = Get.put(ExamPaperController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: ScreensAppBar(
        title: 'reading-materials'.tr, 
        onPressed: () => Get.back(),
      ),
      
      // backgroundColor: AppColors.secondaryBlack,
      body:  Obx(
        () => (readingMaterialController.loading.value)
        ? const Center(child: CircularProgressIndicator())
        : Container(
          height: Get.height,
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            itemCount: readingMaterialController.examPapers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 100,
              crossAxisCount: 1,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 0.0,
            ),
            itemBuilder: (context, index) {
              ExamPaper examPaper = readingMaterialController.examPapers[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: Row(
                    children: [
                      ListView.builder(
                      scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: examPaper.media!.length,
                        itemBuilder: (context,index){
                         Media media = examPaper.media![index];
                          return IconButton(
                            onPressed: (){
                              Get.to(() => PdfReaderScreen(title: examPaper.name??"", url: media.originalUrl??""));
                            }, 
                            icon: const Icon(Icons.picture_as_pdf), 
                            color: Colors.red, 
                            iconSize: 50,
                          );
                        }
                      ), 
                      Text(
                        examPaper.name??"",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        )
      )
    );
  }
}
