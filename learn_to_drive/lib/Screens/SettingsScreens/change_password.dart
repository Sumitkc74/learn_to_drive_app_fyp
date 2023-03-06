import 'package:first_app/Controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
  String _currentPassword = '';
  String _newPassword= '';
  String _confirmNewPassword = '';
  bool currentPasswordVisible=false;
  bool newPasswordVisible=false;
  bool confirmPasswordVisible=false;
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
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
          SingleChildScrollView(
            child:Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1, 
                right: 35, 
                left: 35
              ),

              child: Column(
                children: [
                  TextField(
                    obscureText: !currentPasswordVisible,
                    decoration: InputDecoration(
                      filled: true, 
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Current Password',
                      suffixIcon: IconButton(
                        icon: Icon( !currentPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off
                        ),
                        onPressed: () {
                          setState(() { 
                            currentPasswordVisible = !currentPasswordVisible; 
                          });
                        },
                      ),
                      border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                    ),
                    onChanged: (value) {
                      _currentPassword = value;
                    },
                  ),
                  const SizedBox(height: 25,),

                  TextField(
                    obscureText: !newPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'New Password',
                      helperText:"New password must be diferent from current password",
                      helperStyle:const TextStyle(color:Color(0xFFFFDE17)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      filled: true, 
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon( !newPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            newPasswordVisible = !newPasswordVisible; 
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      _newPassword = value;
                    }
                  ),
                  const SizedBox(height: 25,),

                  TextField(
                    obscureText: !confirmPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      filled: true, 
                      fillColor: Colors.white,
                      suffixIcon: IconButton(                          
                        icon: Icon( 
                          !confirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off
                        ),
                        onPressed: () {
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible; 
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      _confirmNewPassword = value;
                    }
                  ),
                  const SizedBox(height: 30,),
                  
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFDE17),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child:(
                      TextButton(onPressed: () =>  authController.changePassword( currentPassword: _currentPassword, newPassword: _newPassword, confirmNewPassword: _confirmNewPassword),
                        child: const Text(
                          'Change Password',
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
          ),
        ], 
      ),
    );
  }
}
