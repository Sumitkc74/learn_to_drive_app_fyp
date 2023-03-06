import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_app/Controllers/auth_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  String _email = '';
  final forgotPasswordController = Get.put(AuthController());
  
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
                    style:TextStyle(color: Colors.white, fontSize: 28
                    )
                  )
                ),
                const SizedBox(height: 25,),

                // TextField(
                //   decoration: const InputDecoration(
                //     filled: true, 
                //     fillColor: Colors.white,
                //     hintText: 'Enter verification code',
                //     border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                //   ),
                //   onChanged: (value) {
                //     code = value;
                //   },
                // ),
                // const SizedBox( height: 20,),

                TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    filled: true, 
                    fillColor: Colors.white,
                    hintText: 'Enter email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onChanged: (value) {
                    _email = value;
                  },
                ),
                const SizedBox( height: 20,),

                Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDE17),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child:(
                    TextButton(
                      onPressed: () => forgotPasswordController.forgotPassword(email: _email), 
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => forgotPasswordController.forgotPassword(email: _email), 
                      child: const Text(
                        'Send another code',
                        style: TextStyle(
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
        ], 
      ),
    );
  }
}