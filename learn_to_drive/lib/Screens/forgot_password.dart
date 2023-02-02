import 'dart:convert';

import 'package:first_app/Services/globals.dart';
import 'package:first_app/navigator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Services/auth_services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  String email = '';

  onConfirmButtonPressed() async {
    if(email.isNotEmpty){
      
      http.Response response = await AuthServices.resetPassword(email);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const Navigation(),
            ));
            // ignore: use_build_context_synchronously
            errorSnackBar(context, responseMap.values.first);
            
      } else {
        // ignore: use_build_context_synchronously
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Enter your email address');
    }

    }
    

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
                    email = value;
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
                      onPressed: () => onConfirmButtonPressed(), 
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
                        onPressed: () => onConfirmButtonPressed(), 
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