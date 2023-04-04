import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Controllers/exam_information_controller.dart';
import 'package:first_app/Models/exam_information_model.dart';
import 'package:first_app/utils/pdf_reader.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';

class ExamInformationPage extends StatelessWidget {
  ExamInformationPage({super.key});

  final examInformationController = Get.put(ExamInformationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(
        title: 'exam-trial-information'.tr, 
        onPressed: (){
          Get.back();
        }
      ),
      
      body:  Obx(
        () => (examInformationController.loading.value)
        ? const Center(child: CircularProgressIndicator())
        : Container(
          height: Get.height,
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            itemCount: examInformationController.examInformations.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 100,
              crossAxisCount: 1,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 0.0,
            ),
            itemBuilder: (context, index) {
              ExamInformation examInformation = examInformationController.examInformations[index];
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
                        itemCount: examInformation.media!.length,
                        itemBuilder: (context,index){
                         Media media = examInformation.media![index];
                          return IconButton(
                            onPressed: (){
                              Get.to(() => PdfReaderScreen(title: examInformation.name??"", url: media.originalUrl??""));
                            }, 
                            icon: const Icon(Icons.picture_as_pdf), 
                            color: Colors.red, 
                            iconSize: 50,
                          );
                        }
                      ), 
                      Text(
                        examInformation.name??"",
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