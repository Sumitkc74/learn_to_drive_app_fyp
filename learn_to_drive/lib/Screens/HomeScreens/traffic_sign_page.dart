import 'package:first_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:first_app/Models/traffic_sign.dart';
import '../../Controllers/traffic_sign_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrafficSignsPage extends StatefulWidget {
   const TrafficSignsPage({super.key});

  @override
  State<TrafficSignsPage> createState() => _TrafficSignsPageState();
}

class _TrafficSignsPageState extends State<TrafficSignsPage> {
    //declare the isBack bool
  bool isBack = true;

  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

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
        foregroundColor: AppColors.primaryBlack,
        backgroundColor: AppColors.primaryYellow,
        shadowColor: AppColors.primaryBlack,
      ),
      
      backgroundColor: AppColors.secondaryBlack,
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

                        GestureDetector(
                          onTap: _flip,
                          child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: angle),
                          duration: const Duration(seconds: 1),
                          builder: (BuildContext context, double val, __) {
                            //here we will change the isBack val so we can change the content of the card
                            if (val >= (pi / 2)) {
                              isBack = false;
                            } else {
                              isBack = true;
                            }
                            return (Transform(
                              //let's make the card flip by it's center
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(val),
                              child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: isBack
                                    ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: trafficSign.media!.length,
                                        itemBuilder: (context,index){
                                          Media media= trafficSign.media![index];
                                          return
                                          
                                          
                                           CachedNetworkImage(
                                            placeholder: (BuildContext context, String url) => const Center(child: CircularProgressIndicator()), imageUrl: media.originalUrl??"",
                                            height: 100,
                                            width: 100,
                                            errorWidget: (context, url, error) {
                                              return const Text("no text");
                                            },
                                          );
                                        }
                                      ),  
                                    )
                                     //if it's back we will display here
                                    : Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..rotateY(
                                            pi), // it will flip horizontally the container
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      child: Center(
                                        child: 
                                          Text(
                                            trafficSign.name??"",style: const TextStyle(color: Colors.white),
                                          ),
                                          //  Text(
                                          //   trafficSign.description??"",style: const TextStyle(color: Colors.white),
                                          // ),
                                          
                                      ),
                                    ),
                                ),
                              ),
                            )
                            );
                          } //else we will display it here,
                        ),
                      )]
                    )
                  );
                }
          ),
        ),         
      ),
    );
  }     
}  
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
