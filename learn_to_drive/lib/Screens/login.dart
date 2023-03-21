import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Services/globals.dart';
import 'package:first_app/Controllers/auth_controller.dart';
import 'package:first_app/Screens/forgot_password.dart';
import 'package:first_app/Screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  bool passwordVisible = false;
  final loginController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  TextField(
                    decoration: InputDecoration(
                      filled: true, 
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'email'.tr,
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                    ),
                    onChanged: (value) {
                      _email = value;
                      setEmail(_email);
                    },
                  ),
                  const SizedBox(height: 25,),

                  TextField(
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      filled: true, 
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'password'.tr,
                      suffixIcon: IconButton(
                          icon: Icon( !passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible; 
                          });
                        },
                      ),
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                    ),
                    onChanged: (value) { _password = value; },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {
                        Get.to(()=>const ForgotPasswordScreen());
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
                        onPressed: () => loginController.login(email: _email, password: _password),
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
                        onPressed: () {
                          Get.to(()=> const RegisterScreen());
                        }, 
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
