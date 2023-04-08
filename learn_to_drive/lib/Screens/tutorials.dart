import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_app/Controllers/tutorial_controller.dart';
import 'package:first_app/Models/tutorial_model.dart';
import 'package:first_app/Screens/HomeScreens/notifications.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';

class TutorialsScreen extends StatelessWidget {
  TutorialsScreen({super.key});

 final tutorialController = Get.put(TutorialController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(
        title: 'tutorials'.tr,
        automaticallyImplyLeading: false,
        action: IconButton(
          onPressed: () {
            Get.to(() => NotificationsScreen());
          },
          icon: const Icon(Icons.notifications_outlined),
        ),
      ),

      body: Obx(
        () => (tutorialController.loading.value)
        ? const Center(child: CircularProgressIndicator())
        : Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            itemCount: tutorialController.tutorials.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 150,
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              Tutorial tutorial = tutorialController.tutorials[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text(
                      tutorial.title??"",
                      style: const TextStyle(fontSize: 20),
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: tutorialController.tutorials.length,
                      itemBuilder: (context,index){
                        return IconButton(
                          onPressed: (){
                            tutorialController.launchInBrowser(tutorial.videoLink??"");
                          }, 
                          icon: const Icon(Icons.document_scanner_outlined)
                        );
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