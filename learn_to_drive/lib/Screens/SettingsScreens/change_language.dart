import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Language',
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
      body: Stack(
        children: [
            Container( 
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    
                    child: Text(
                      "Available Languages",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
          
                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            const Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 30,
                            );
                          },
                          child: SizedBox(
                            height: 60,
                            width: 390,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: const [
                                  Text(
                                    "English",
                                    style: TextStyle(
                                      color: Colors.black, 
                                      fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2,),

                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            const Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 30,
                            );
                          },
                          child: SizedBox(
                            height: 60,
                            width: 390,
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                children: const [
                                  Text(
                                    "Nepali",
                                    style: TextStyle(
                                      color: Colors.black, 
                                      fontSize: 20
                                    ),
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
                ]
              )
            )
        ] 
      )
    );
  }
}