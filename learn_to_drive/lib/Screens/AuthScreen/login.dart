import 'package:first_app/utils/widgets/button_widget.dart';
import 'package:first_app/utils/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_app/Controllers/auth_controller.dart';
import 'package:first_app/Screens/AuthScreen/forgot_password.dart';
import 'package:first_app/Screens/AuthScreen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool passwordVisible = false;
  final loginController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF303030),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35,top: 120),
            child: Text(
              'welcome-to-app'.tr, 
              style: const TextStyle( 
                // color: Colors.white, 
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
                      // fillColor: Colors.grey[800],
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'email'.tr,
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),

                  // TextFieldWidget(
                  //   label: 'email'.tr, 
                  //   icon: Icons.email, 
                  //   onChanged: (value) {
                  //     email = value;
                  //   },
                  // ),

                  const SizedBox(height: 25,),

                  // PasswordTextField(label: 'password'.tr,),

                  TextField(
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      filled: true, 
                      // fillColor: Colors.grey[800],
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
                    onChanged: (value) { password = value; },
                  ),



                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(onPressed: () {
                  //       Get.to(()=>const ForgotPasswordScreen());
                  //     }, 
                  //       child: Text(
                  //         '${'forgot-password'.tr}?',
                  //         style: const TextStyle(
                  //           decoration: TextDecoration.underline,
                  //             color: Color(0xFFFFDE17),
                  //             fontSize: 14,
                  //         )
                  //       )
                  //     )
                  //   ],
                  // ),

                  TextOnlyButtonWidget(
                    label: '${'forgot-password'.tr}?', 
                    onPressed: () {
                      Get.to(()=>const ForgotPasswordScreen());
                    }, 
                    mainAxisAlignment: MainAxisAlignment.end,
                    size: 14,
                  ),
                  const SizedBox(height: 30),

                  FilledButtonWidget(
                    label: 'login'.tr,
                    onPressed: () => 
                    loginController.login(email: email, password: password), 
                    margin: 10
                  ),
                    
                  // Container(
                  //   margin: const EdgeInsets.all(10),
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFFFDE17),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child:(
                  //     TextButton(
                  //       onPressed: () => loginController.login(email: email, password: password),
                  //       child: Text(
                  //         'login'.tr,
                  //         style: const TextStyle(
                  //           fontSize: 18,
                  //           color: Colors.white,
                  //         )
                  //       )
                  //     )
                  //     ),
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {
                  //         Get.to(()=> const RegisterScreen());
                  //       }, 
                  //       child: Text(
                  //         'create-new-account'.tr,
                  //         style: const TextStyle(
                  //           decoration: TextDecoration.underline,
                  //           fontSize: 18,
                  //           color: AppColors.primaryYellow
                  //         )
                  //       )
                  //     )
                  //   ],
                  // )

                  TextOnlyButtonWidget(
                    label: 'create-new-account'.tr, 
                    onPressed: () {
                      Get.to(()=>const RegisterScreen());
                    }, 
                    mainAxisAlignment: MainAxisAlignment.center,
                    size: 18,
                  ),

                ],
              )
            ),
          ),
        ], 
      ),
    );
  }
}
