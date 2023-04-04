import 'package:first_app/Services/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/utils/widgets/screens_app_bar.dart';
import 'package:first_app/Controllers/exam_paper_controller.dart';
import 'package:first_app/Models/exam_paper_model.dart';
import 'package:first_app/utils/pdf_reader.dart';

class ReadingMaterialsPage extends StatefulWidget {
  ReadingMaterialsPage({super.key});

  @override
  State<ReadingMaterialsPage> createState() => _ReadingMaterialsPageState();
}

class _ReadingMaterialsPageState extends State<ReadingMaterialsPage> {
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

  void changeLanguage(String language) {
    setState(() {
      chosenLanguage = language;
    });
  }

 final readingMaterialController = Get.put(ExamPaperController());

 
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
        () => (readingMaterialController.loading.value)
        ? const Center(child: CircularProgressIndicator())
        : 
        SingleChildScrollView(
          child: Column(
            children: [
               Row( 
              mainAxisAlignment : MainAxisAlignment.spaceBetween, 
              children : [ 
                Expanded ( 
                  child : RawMaterialButton( 
                    highlightColor: Colors.red,
                    onPressed : () {
                      changeLanguage('English');
                    } ,
                    textStyle: TextStyle(color: chosenLanguage == 'English' ? Colors.white : Colors.black),
                    fillColor : chosenLanguage == 'English' ? Colors.blue : Colors.white, 
                    shape : const StadiumBorder( 
                      side : BorderSide (
                        color : Colors.blue), 
                    ),
                    child : Text( 
                      'english'.tr, 
                      // style : const TextStyle(color : Colors.white), 
                    ),  
                  ), 
                ),  
                Expanded ( 
                  child : RawMaterialButton( 
                    onPressed : () {
                      changeLanguage('Nepali');
                    }, 
                    textStyle: TextStyle(color: chosenLanguage == 'Nepali' ? Colors.white : Colors.black),
                    fillColor : chosenLanguage == 'Nepali' ? Colors.blue : Colors.white,
                    shape : const StadiumBorder (), 
                    child : Text( 
                      'nepali'.tr, 
                      // style : TextStyle(color : Colors.white), 
                      ),
                    ),
                  ),
            ]
          ),
              SizedBox(
                height: Get.height,
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
                              itemCount: 1,
                              itemBuilder: (context,index){
                               Media media = examPaper.media![changeMediaIndex()];
                                return IconButton(
                                  onPressed: (){
                                    Get.to(() => PdfReaderScreen(title: checkLanguage(examPaper.name??'', examPaper.nepaliName??''), url: media.originalUrl??""));
                                  }, 
                                  icon: const Icon(Icons.picture_as_pdf), 
                                  color: Colors.red, 
                                  iconSize: 50,
                                );
                              }
                            ), 
                            Text(
                              checkLanguage(examPaper.name??'', examPaper.nepaliName??''),
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
