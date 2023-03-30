import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsState();
}

class _NotificationsState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "notifications".tr,
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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35,top: 120),
            child: Text(
              'welcome-to-app'.tr, 
              style: const TextStyle( 
                color: Colors.white, 
                fontSize: 34,
              )
            )
          ),
            
          SingleChildScrollView(
            child:Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.35, 
                right: 35, 
                left: 35
              ),

              child: Column(
                children: [
                  const SizedBox(height: 25,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          
                      }, 
                        child: Text(
                          '${'forgot-password'.tr}?',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                              color: Color(0xFFFFDE17),
                              fontSize: 14,
                          )
                        )
                      )
                    ],
                  ),
                    const SizedBox(height: 30),
                    
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDE17),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:(
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'login'.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )
                        )
                      )
                      ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'create-new-account'.tr,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xFFFFDE17)
                          )
                        )
                      )
                    ],
                  )
                ],
              )
            ),
          ),
        ], 
        
      ),
    );
  }
}