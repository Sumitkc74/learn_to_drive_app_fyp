import 'dart:convert';

import 'package:first_app/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Services/auth_services.dart';
import '../Services/globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        // ignore: use_build_context_synchronously
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xFF303030),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35,top: 120),
              child: const Text(
                'Welcome to \nLearn to Drive', 
                style:TextStyle( color: Colors.white, fontSize: 34,)
              )
            ),
            
            SingleChildScrollView(
              child:Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.40, 
                  right: 35, 
                  left: 35
                ),

                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        filled: true, 
                        fillColor: Colors.white,
                        hintText: 'Username / Email',
                        border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                      ),
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    const SizedBox(height: 20,),

                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true, 
                        fillColor: Colors.white,
                        hintText: 'Password',
                        //suffixIcon: Icon(Icons.remove_red_eye, ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye ),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder( borderRadius: BorderRadius.circular(10))
                      ),
                      onChanged: (value) {
                        _password = value;
                      },
                    ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {
                            Navigator.pushNamed(context, 'forgotPassword');
                        }, 
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
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
                        TextButton(onPressed: () =>  loginPressed(),
                        //{ Navigator.pushNamed(context, 'HomePage');}, 
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )
                          )
                        )
                        ),
                    ),
                    


                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Login', 
                          style: TextStyle(
                            fontSize: 24, 
                            fontWeight: FontWeight.bold
                            ),
                          ),

                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward),
                            ),
                        )
                      ],
                    ),

                    */

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          }, 
                          child: const Text(
                            'Create a new account',
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
            ),
          ], 
        ),
      );     
    }
  }
