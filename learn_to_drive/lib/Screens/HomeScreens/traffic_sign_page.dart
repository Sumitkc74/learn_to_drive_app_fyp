import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Models/traffic_sign.dart';
import '../../Controllers/traffic_sign_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrafficSignsPage extends StatelessWidget {
   TrafficSignsPage({super.key});

  final c = Get.put(TrafficSignController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'traffic-signs'.tr,
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
                itemCount: c.trafficSigns.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) {
                  TrafficSign trafficSign =
                    c.trafficSigns[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          trafficSign.name??"",style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          trafficSign.description??"",style: const TextStyle(color: Colors.white),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: trafficSign.media!.length,
                          itemBuilder: (context,index){
                            Media media= trafficSign.media![index];
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
            
            // Column(
            //     children: [
            //       SizedBox(
            //         height: Get.height - 140,
            //         child: ListView.builder(
            //           shrinkWrap: true,
            //           itemCount: c.trafficSigns.length,

            //           itemBuilder: (context, index) {
            //             TrafficSign trafficSign =
            //                 c.trafficSigns[index];
            //             return Column(
            //               children: [
            //                 SizedBox(
            //                   child: Column(
            //                     children: [
            //                       Text(
            //                         trafficSign.name??"",style: const TextStyle(color: Colors.white),
            //                       ),
            //                       SizedBox(
            //                         height: 150,
            //                         width: 150,
            //                         child: ListView.builder(
            //                           shrinkWrap: true,
            //                           itemCount: trafficSign.media!.length,
            //                           itemBuilder: (context,index){
            //                             Media media= trafficSign.media![index];
            //                             return 
            //                             // Container(
            //                             //   height: 200,
                                          
            //                             //   child: Image.network(media.originalUrl!),
            //                             // );
            //                             // Text(media.originalUrl.toString());
            //                             //  const Image(image: NetworkImage("http://localhost:8000/storage/3/no-right-turn.png"));
            //                           Wrap(
            //                             spacing: 3.0,
            //                             runSpacing: 4.0,
            //                             children: [
            //                               // Text(media.originalUrl!),
            //                               Text(trafficSign.name.toString()),
            //                               Text(media.id.toString()),
            //                               // Image(image: NetworkImage("http://172.16.16.57/storage/1/parking.png")),
                                             
            //                               Image(image: NetworkImage(media.originalUrl!), height: 100,),
            //                             ],
            //                           );
            //                                   //            Column(
            //                                   //              children: [
            //                                   //               // Text(media.originalUrl!),
            //                                   //    Text(trafficSign.name.toString()),
            //                                   // Text(media.id.toString()),
            //                                   // // Image(image: NetworkImage("http://172.16.16.57/storage/1/parking.png")),
                                             
            //                                   // Image(image: NetworkImage(media.originalUrl!), height: 100,),
            //                                   //              ],
            //                                   //            );
                                  
            //                         }),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 //
            // //                 
                            
            //               ],
            //             );
            //           },
            //         ),
            //       )
            //     ],
            //   ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Image.asset('images/logo.svg'),
              //     Image.asset('images/logo.svg'),
              //   ],
              // )
      
      // FutureBuilder<List>(
      //   future: trafficSignController.getAllTrafficSign(),
      //   builder: (context, snapshot) {
      //     // print(snapshot.data);
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //           itemBuilder: (context, i) {
      //           return Card(
      //             child: ListTile(
      //               title: Text(
      //                   snapshot.data![i]['TrafficSign'],
      //                 style: const TextStyle(fontSize: 30.0),
      //               ),
      //               subtitle: Text(
      //                   snapshot.data![i]['Image'],
      //                 style: const TextStyle(fontSize: 20.0),
      //                 ),
      //             ),
      //           );
      //         },              
      //       );
      //     } else {
      //       return const Center(
      //         child: Text('No Data Found'),
      //       );
      //     }
      //   },
      // )
    );
  }
}