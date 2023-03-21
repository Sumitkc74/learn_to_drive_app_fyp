import 'package:first_app/Controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
} 

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';
  String _confirmPassword = '';
  bool passwordVisible=false; 
  bool confirmPasswordVisible=false;
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'sign-up'.tr,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      backgroundColor: const Color(0xFF303030),
      body: Stack(
        children: [
          SingleChildScrollView(
              child:Container(
              padding: const EdgeInsets.only(
                right: 35, 
                left: 35
              ),

              child: Column(
                children: [            
                  Row(
                    children: [
                      Flexible(child:
                        TextField(
                          decoration: InputDecoration(
                          hintText: 'first-name'.tr,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          filled: true, 
                          fillColor: Colors.white,
                          ),
                          onChanged: (value) { _firstName = value; }
                        ),
                      ),
                      const SizedBox(width:10),
                      
                      Flexible(child: 
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'last-name'.tr,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            filled: true, 
                            fillColor: Colors.white,
                          ),
                          onChanged: (value) { _lastName = value; }
                        ),
                      ),
                    ],
                  ),
                  const SizedBox( height: 25,),

                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'email'.tr,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      filled: true, 
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) { _email = value; }
                  ),
                  const SizedBox(height: 25,),  

                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: 'phone-number'.tr,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      filled: true, 
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) { _phoneNumber = value; }
                  ),
                  const SizedBox(height: 25,),

                  TextField(
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'password'.tr,
                      helperText:"Password must contain atleast 8 letters, a uppercase and a special character",
                      helperStyle:const TextStyle(color:Color(0xFFFFDE17)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      filled: true, 
                      fillColor: Colors.white,
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
                    ),
                    onChanged: (value) { _password = value; }
                  ),
                  const SizedBox(height: 25,),

                  TextField(
                    obscureText: !confirmPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'confirm-password'.tr,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      filled: true, 
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon( !confirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible; 
                          });
                        },
                      ),
                    ),
                    onChanged: (value) { _confirmPassword = value; }
                  ),
                  const SizedBox(height: 30,),

                  Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDE17),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child:(
                      TextButton(
                        onPressed: () => 
                        authController.register(
                          firstName: _firstName, 
                          lastName: _lastName, 
                          email: _email, 
                          phoneNumber: _phoneNumber, 
                          password: _password, 
                          confirmPassword: _confirmPassword
                        ),
                        child: Text(
                          'sign-up'.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ); 
  }
}
