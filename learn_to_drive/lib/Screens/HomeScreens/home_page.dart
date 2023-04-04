import 'package:first_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Screens/HomeScreens/exam_information_page.dart';
import 'package:first_app/Screens/HomeScreens/reading_materials_page.dart';
import 'package:first_app/Screens/HomeScreens/traffic_sign_page.dart';
import 'package:first_app/Screens/HomeScreens/vision_test_page.dart';
import 'package:first_app/Screens/HomeScreens/mock_exam_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "welcome".tr,
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      
      backgroundColor: AppColors.secondaryBlack,
      body: Stack(
        children: [
          SingleChildScrollView(
            child:Container( 
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                      
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF3C3C3C),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Get.to(()=>  const TrafficSignsPage());
                            },
                            splashColor: Colors.grey.withOpacity(0.1),
                            child: SizedBox(
                              height: 120,
                              width: Get.width/1.2,
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10.0,
                                  children: [
                                    Text(
                                      "traffic-signs".tr,
                                      style: const TextStyle(color: Colors.white, fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
              
                    
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shadowBlack,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Get.to(()=> ReadingMaterialsPage());
                            },
                            splashColor: Colors.grey.withOpacity(0.1),
                            child: SizedBox(
                              height: 120,
                              width: Get.width/1.2,
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10.0,
                                  children: [
                                    Text(
                                      "reading-materials".tr,
                                      style: const TextStyle(color: Colors.white,  fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
              
              
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shadowBlack,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Get.to(()=> const MockExam());
                              // Navigator.pushNamed(context, 'mockExam');
                            },
                            splashColor: Colors.grey.withOpacity(0.1),
                            child: SizedBox(
                              height: 120,
                              width: Get.width/1.2,
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10.0,
                                  children: [
                                    Text(
                                      "mock-exam".tr,
                                      style: const TextStyle(color: Colors.white,  fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
              
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shadowBlack,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Get.to(()=> ExamInformationPage());
                              },
                            splashColor: Colors.grey.withOpacity(0.1),
                            child: SizedBox(
                              height: 120,
                              width: Get.width/1.2,
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10.0,
                                  children: [
                                    Text(
                                      "exam-trial-information".tr,
                                      style: const TextStyle(color: Colors.white,  fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
              
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.shadowBlack,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Get.to(()=> VisionTestPage());
                            },
                            splashColor: Colors.grey.withOpacity(0.1),
                            child: SizedBox(
                              height: 120,
                              width: Get.width/1.2,
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10.0,
                                  children: [
                                    Text(
                                      "vision-tests".tr,
                                      style: const TextStyle(color: Colors.white,  fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
