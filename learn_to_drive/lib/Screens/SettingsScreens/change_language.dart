import 'package:first_app/Services/globals.dart';
import 'package:first_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {

  // final List locale =[
  //   {'name':'ENGLISH','locale': const Locale('en','US')},
  //   {'name':'नेपाली','locale': const Locale('ne','NP')},
  // ];

  // updateLanguage(Locale locale){
  //   Get.back();
  //   Get.updateLocale(locale);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'change-language'.tr,
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

      // backgroundColor: const Color(0xFF303030),
      body: Stack(
        children: [
            Center(
              child: Container( 
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'available-language'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                      
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                          child: InkWell(
                            onTap: () {
                              const Icon(
                                Icons.check,
                                // color: Colors.black,
                                size: 30,
                              );
                              var locale = const Locale('en','US');
                              Get.updateLocale(locale);
                              setIsEnglish(true);
                            },
                            child: SizedBox(
                              height: 60,
                              width: Get.width/1.1,
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10.0,
                                  children: [
                                    Text(
                                      "english".tr,
                                      style: const TextStyle(
                                        // color: Colors.black, 
                                        fontSize: 20
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
            
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                          child: InkWell(
                            onTap: () {
                              const Icon(
                                Icons.check,
                                // color: Colors.black,
                                size: 30,
                              );
                              var locale = const Locale('ne','NP');
                              Get.updateLocale(locale);
                              setIsEnglish(false);
                            },
                            child: SizedBox(
                              height: 60,
                              width: Get.width/1.1,
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10.0,
                                  children: [
                                    Text(
                                      "nepali".tr,
                                      style: const TextStyle(
                                        // color: Colors.black, 
                                        fontSize: 20
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                  ]
                )
              ),
            )
        ] 
      )
    );
  }
}