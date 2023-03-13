import 'package:first_app/Controllers/vision_test_controller.dart';
import 'package:first_app/models/vision_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisionTestPage extends StatelessWidget {
  VisionTestPage({super.key});


  final c = Get.put(VisionTestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vision Tests',
          style: TextStyle(
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
            : Column(
                children: [
                  SizedBox(
                    height: Get.height - 140,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: c.visionTests.length,

                      itemBuilder: (context, index) {
                        VisionTest visionTest =
                            c.visionTests[index];
                        return Text(visionTest.number??"",style: const TextStyle(color: Colors.white),);
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}