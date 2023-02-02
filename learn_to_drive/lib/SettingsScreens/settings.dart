import 'dart:convert';

import 'package:first_app/Screens/login.dart';
import 'package:first_app/Services/auth_services.dart';
import 'package:first_app/Services/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  onLogoutPressed() async {
    http.Response response = await AuthServices.logout();
    Map responseMap = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        ));
      // ignore: use_build_context_synchronously
      errorSnackBar(context, responseMap.values.first);          
      } 
      else {
        // ignore: use_build_context_synchronously
        errorSnackBar(context, responseMap.values.first);
      }
    }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle, size: 80,),
        ),
        // actions: const [
        //   Icon(Icons.account_circle, size: 80,),
        // ],
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
                            Navigator.pushNamed(context, 'notifications');
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
                                children: const [
                                  Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "Notifications",
                                    style: TextStyle(
                                      color: Colors.white, 
                                      fontSize: 25
                                    ),
                                  ),
                                  Icon(
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
                            Navigator.pushNamed(context, 'changePassword');
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
                                children: const [
                                  Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "Change Password",
                                    style: TextStyle(color: Colors.white,  fontSize: 25),
                                  ),
                                  Icon(
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
                            Navigator.pushNamed(context, 'change_language');
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
                                children: const [
                                  Icon(
                                    Icons.language,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    "Change Language",
                                    style: TextStyle(color: Colors.white,  fontSize: 25),
                                  ),
                                  Icon(
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
                          onTap: () => onLogoutPressed(),
                          // {
                          //   Navigator.pushNamed(context, 'login');
                          // },
                          splashColor: Colors.grey.withOpacity(0.1),
                          child: SizedBox(
                            height: 80,
                            width: 370,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: const [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(color: Colors.white,  fontSize: 23),
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