import 'dart:convert';

import 'package:first_app/Screens/home_page.dart';
import 'package:first_app/Services/auth_services.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Services/globals.dart';

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

  createAccountPressed() async {
    if(_firstName.isEmpty || _lastName.isEmpty || _email.isEmpty || _phoneNumber.isEmpty || _password.isEmpty || _confirmPassword.isEmpty){
      errorSnackBar(context, 'Enter all the fields');
    }
    else{
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_email);        
      if (emailValid) {
        if(_password == _confirmPassword){
          String name = "$_firstName $_lastName";
          http.Response response = await AuthServices.register(name, _email, _phoneNumber, _password);
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (response.statusCode == 200) {
            // ignore: use_build_context_synchronously
            Navigator.push(
              context, 
              MaterialPageRoute(builder:(
                BuildContext context) => const HomeScreen()));
          } else {
            // ignore: use_build_context_synchronously
            errorSnackBar(context, responseMap.values.first[0]);
          }
        }else{
          errorSnackBar(context, 'Enter same password to confirm');
        }
      } else {
        errorSnackBar(context, 'Email not valid');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(
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
                            hintText: 'First Name',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            filled: true, 
                            fillColor: Colors.white,
                            ),
                            onChanged: (value) {
                              _firstName = value;
                            }
                          ),
                        ),
                        const SizedBox(width:10),
                        
                        
                        Flexible(child: 
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              filled: true, 
                              fillColor: Colors.white,
                            ),
                            onChanged: (value) {
                              _lastName = value;
                            }
                          ),
                        ),
                      ],
                    ),
                    const SizedBox( height: 25,),

                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true, 
                        fillColor: Colors.white,
                      ),                      
                      onChanged: (value) {
                        _email = value;
                      }
                    ),
                    const SizedBox(height: 25,),  

                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true, 
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        _phoneNumber = value;
                      }
                    ),
                    const SizedBox(height: 25,),

                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true, 
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye ),
                          onPressed: () {},
                        ),
                      ),
                      onChanged: (value) {
                        _password = value;
                      }
                    ),
                    const SizedBox(height: 25,),

                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true, 
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye ),
                          onPressed: () {},
                        ),
                      ),
                      onChanged: (value) {
                        _confirmPassword = value;
                      }
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
                          onPressed: () => createAccountPressed(),
                          //{Navigator.pushNamed(context, 'HomePage');}, 
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
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
