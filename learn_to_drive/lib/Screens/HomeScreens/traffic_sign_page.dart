import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:first_app/models/traffic_sign.dart';
import '../../Controllers/traffic_sign_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrafficSignsPage extends StatelessWidget {
   TrafficSignsPage({super.key});

  final c = Get.put(TrafficSignController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Traffic Signs',
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
                      itemCount: c.trafficSigns.length,

                      itemBuilder: (context, index) {
                        TrafficSign trafficSign =
                            c.trafficSigns[index];
                        return Column(
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  Text(
                                    trafficSign.name??"",style: const TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                         shrinkWrap: true,
                                      itemCount: trafficSign.media!.length,
                                      itemBuilder: (context,index){
                                        Media media= trafficSign.media![index];
                                        return 
                                        // Container(
                                        //   height: 200,
                                          
                                        //   child: Image.network(media.originalUrl!),
                                        // );
                                        Text(media.originalUrl.toString());
                                      //  const Image(image: NetworkImage("http://localhost:8000/storage/3/no-right-turn.png"));

                                              //            CachedNetworkImage(
                                              //             imageUrl: media.originalUrl!,
                                              //   placeholder: (BuildContext context, String url) => 
                                              // const Image(image: NetworkImage("https://picsum.photos/300/300",),width: 30,height: 30,
                                              // ),
                                              // );
                                  
                                    }),
                                  )
                                ],
                              ),
                            ),
                            
            //                 CachedNetworkImage(
            //   placeholder: (BuildContext context, String url) => Container(
            //     width: 320,
            //     height: 240,
            //     color: Colors.purple,
            //   ),
            // ),
                            
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Image.asset('images/logo.svg'),
              //     Image.asset('images/logo.svg'),
              //   ],
              // )
      ),
      
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