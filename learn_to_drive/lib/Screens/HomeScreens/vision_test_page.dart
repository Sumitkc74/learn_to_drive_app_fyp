import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/Controllers/vision_test_controller.dart';
import 'package:first_app/Models/vision_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisionTestPage extends StatelessWidget {
  VisionTestPage({super.key});


  final c = Get.put(VisionTestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'vision-tests'.tr,
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

      body:  Obx(
        () => (c.loading.value)
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                itemCount: c.visionTests.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) {
                  VisionTest visionTest =
                    c.visionTests[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          visionTest.number??"",style: const TextStyle(color: Colors.white),
                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: visionTest.media!.length,
                          itemBuilder: (context,index){
                            Media media= visionTest.media![index];
                            return CachedNetworkImage(
                              placeholder: (BuildContext context, String url) => const Center(child: CircularProgressIndicator()), imageUrl: media.originalUrl??"",
                              height: 100,
                              width: 100,
                              errorWidget: (context, url, error) {
                                return const Text("no text");
                              },
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