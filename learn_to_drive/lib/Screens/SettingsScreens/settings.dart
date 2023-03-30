import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/Controllers/auth_controller.dart';
import 'package:first_app/Services/globals.dart';
import 'package:first_app/Screens/SettingsScreens/change_language.dart';
import 'package:first_app/Screens/SettingsScreens/change_password.dart';
import 'package:first_app/Screens/SettingsScreens/notifications.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  final logoutController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome\n    $email",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black, 
          ),
        ),
        toolbarHeight: 150,
        foregroundColor: const Color(0xff00183F),
        backgroundColor: const Color(0xFFFFDE17),
        shadowColor: const Color(0xff00183F),
      ),
      
      backgroundColor: const Color(0xFF303030),
      body: Stack(
        children: [
          SingleChildScrollView(
            child:Container( 
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
          
                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF3C3C3C),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Get.to(()=>const NotificationsScreen());
                          },
                          splashColor: Colors.grey.withOpacity(0.1),
                          child: SizedBox(
                            height: 80,
                            width: 370,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: [
                                  const Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "notifications".tr,
                                    style: const TextStyle(
                                      color: Colors.white, 
                                      fontSize: 25
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                    size: 30,
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

                  
                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF3C3C3C),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Get.to(()=>const ChangePasswordScreen());
                          },
                          splashColor: Colors.grey.withOpacity(0.1),
                          child: SizedBox(
                            height: 80,
                            width: 370,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: [
                                  const Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "change-password".tr,
                                    style: const TextStyle(color: Colors.white,  fontSize: 25),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                    size: 30,
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


                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF3C3C3C),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Get.to(()=>const ChangeLanguageScreen());
                          },
                          splashColor: Colors.grey.withOpacity(0.1),
                          child: SizedBox(
                            height: 80,
                            width: 370,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: [
                                  const Icon(
                                    Icons.language,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "change-language".tr,
                                    style: const TextStyle(color: Colors.white,  fontSize: 25),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                    size: 30,
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

                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF3C3C3C),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () => logoutController.logout(),
                          splashColor: Colors.grey.withOpacity(0.1),
                          child: SizedBox(
                            height: 80,
                            width: 370,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: [
                                  const Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  Text(
                                    "logout".tr,
                                    style: const TextStyle(color: Colors.white,  fontSize: 23),
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
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}