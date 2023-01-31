import 'package:first_app/Services/globals.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String email = getEmail();
 
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
                          onTap: () {
                            
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

                  // Row(
                  //   children: [
                  //     Material(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: const Color(0xFF3C3C3C),
                  //       child: InkWell(
                  //         borderRadius: BorderRadius.circular(10),
                  //         onTap: () {},
                  //         splashColor: Colors.grey.withOpacity(0.1),
                  //         child: SizedBox(
                  //           height: 120,
                  //           width: 350,
                  //           child: Center(
                  //             child: Wrap(
                  //               alignment: WrapAlignment.center,
                  //               crossAxisAlignment: WrapCrossAlignment.center,
                  //               spacing: 10.0,
                  //               children: const [
                  //                 Text(
                  //                   "Vision Test",
                  //                   style: TextStyle(color: Colors.white,  fontSize: 25),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 30,),

                  /*
                  BottomAppBar(child: Text("Hello"),)
                  */

                  
                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff00183F),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          splashColor: Colors.grey.withOpacity(0.1),
                          child: Container(
                            height: 104,
                            width: 163,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: const [
                                  Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Home Move",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff00183F),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          splashColor: Colors.grey.withOpacity(0.1),
                          child: Container(
                            height: 104,
                            width: 163,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: const [
                                  Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Office Move",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  */
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}