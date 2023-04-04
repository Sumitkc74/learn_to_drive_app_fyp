import 'package:first_app/Controllers/tutorial_controller.dart';
import 'package:first_app/Models/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialsScreen extends StatefulWidget {
  const TutorialsScreen({super.key});

  @override
  State<TutorialsScreen> createState() => _TutorialsScreenState();
}

class _TutorialsScreenState extends State<TutorialsScreen> {

 final c = Get.put(TutorialController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'tutorials'.tr,
          style: const TextStyle(
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
      body: Obx(
        () => (c.loading.value)
        ? const Center(child: CircularProgressIndicator())
        : Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            itemCount: c.tutorials.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 150,
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              Tutorial tutorial = c.tutorials[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text(
                      tutorial.title??"",
                      style: const TextStyle(color: Colors.white),
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: c.tutorials.length,
                      itemBuilder: (context,index){
                        return IconButton(onPressed: (){
                          c.launchInBrowser(tutorial.videoLink??"");
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