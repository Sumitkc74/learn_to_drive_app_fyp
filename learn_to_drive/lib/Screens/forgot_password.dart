import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF303030),
        elevation: 0,
      ),

      backgroundColor: const Color(0xFF303030),
      body: Stack(
        children: [                        
            Container(
              padding: const EdgeInsets.only(
                right: 35, 
                left: 35
              ),

              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 0,top: 20, bottom: 20),
                    child: const Text(
                      'Get Email Verfication', 
                      style:TextStyle(color: Colors.white, fontSize: 28)
                    )
                  ),
                  const SizedBox(height: 25,),

                  const TextField(
                    decoration: InputDecoration(
                      filled: true, 
                      fillColor: Colors.white,
                      hintText: 'Enter verification code',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                  const SizedBox( height: 20,),

                  Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDE17),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child:(
                      TextButton(
                        onPressed: () {}, 
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )
                        )
                      )
                    ),
                  ),
                ],
              )
            ),
          
        ], 
      ),
    );  
  }
}