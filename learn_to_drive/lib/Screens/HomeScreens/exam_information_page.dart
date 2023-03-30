import 'package:first_app/Controllers/exam_information_controller.dart';
import 'package:first_app/Models/exam_information.dart';
import 'package:first_app/utils/colors.dart';
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
            itemCount: c.examInformations.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 150,
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              ExamInformation examInformation = c.examInformations[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text(
                      examInformation.name??"",
                      style: const TextStyle(color: Colors.white),
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: examInformation.media!.length,
                      itemBuilder: (context,index){
                       Media media= examInformation.media![index];
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