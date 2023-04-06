import 'package:first_app/utils/widgets/pdf_language_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Controllers/exam_information_controller.dart';
import 'package:first_app/Controllers/setting_controller.dart';
import 'package:first_app/Models/exam_information_model.dart';
import 'package:first_app/utils/pdf_reader.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';

class ExamInformationPage extends StatefulWidget {
  const ExamInformationPage({super.key});

  @override
  State<ExamInformationPage> createState() => _ExamInformationPageState();
}

class _ExamInformationPageState extends State<ExamInformationPage> {
  final settingsController = Get.put(SettingsController());
  String chosenLanguage = 'English';
  int index = 0;

  int changeMediaIndex(){
    if(chosenLanguage == 'English'){
      return index = 0;
    }
    else{
      return index = 1;
    }
  }
  final examInformationController = Get.put(ExamInformationController());
 
  @override
  void initState() {
    super.initState();
    chosenLanguage = 'English';
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: ScreensAppBar(
        title: 'reading-materials'.tr, 
        onPressed: () => Get.back(),
      ),
      
      // backgroundColor: AppColors.secondaryBlack,
      body:  Obx(
        () => (examInformationController.loading.value)
        ? const Center(child: CircularProgressIndicator())
        : 
        SingleChildScrollView(
          child: Column(
            children: [
              CustomChoosePdfLanguage(chosenLanguage: chosenLanguage),
              SizedBox(
                height: Get.height,
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
                              itemCount: 1,
                              itemBuilder: (context,index){
                               Media media = examInformation.media![changeMediaIndex()];
                                return IconButton(
                                  onPressed: (){
                                    Get.to(() => PdfReaderScreen(
                                      title: settingsController.checkLanguage(
                                        examInformation.name??'', 
                                        examInformation.nepaliName??''), 
                                      url: media.originalUrl??""
                                    ));
                                  }, 
                                  icon: const Icon(Icons.picture_as_pdf), 
                                  color: Colors.red, 
                                  iconSize: 50,
                                );
                              }
                            ), 
                            Text(
                              settingsController.checkLanguage(
                                examInformation.name??'', 
                                examInformation.nepaliName??''
                              ),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
