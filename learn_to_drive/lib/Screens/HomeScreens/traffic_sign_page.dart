import 'package:first_app/Services/globals.dart';
import 'package:first_app/utils/flip_image.dart';
import 'package:first_app/utils/widgets/screens_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Models/traffic_sign.dart';
import '../../Controllers/traffic_sign_controller.dart';

class TrafficSignsPage extends StatefulWidget {
   const TrafficSignsPage({super.key});

  @override
  State<TrafficSignsPage> createState() => _TrafficSignsPageState();
}

class _TrafficSignsPageState extends State<TrafficSignsPage> {
  final trafficSignController = Get.put(TrafficSignController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: ScreensAppBar(
        title: 'traffic-signs'.tr,
        onPressed: () => Get.back(),
      ),
      
      body:  Obx(
        () => (trafficSignController.loading.value)
        ? const Center(child: CircularProgressIndicator())
        : Container(
          margin: const EdgeInsets.only(top: 30,),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            itemCount: trafficSignController.trafficSigns.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 150,
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              TrafficSign trafficSign = trafficSignController.trafficSigns[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: trafficSign.media!.length,
                        itemBuilder: (context,index){
                          Media media= trafficSign.media![index];
                          return FlippableImage(
                            imageUrl: media.originalUrl ?? "",
                            name: checkLanguage(trafficSign.name??"", trafficSign.nepaliSignName??""),
                          );
                        }
                      )
                    ),
                  ],
                )
              );
            }
          ),
        ),
      ),
    );
  }
}