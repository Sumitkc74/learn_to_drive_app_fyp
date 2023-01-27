import 'package:flutter/material.dart';
import 'package:first_app/Screens/forgot_password.dart';
import 'package:first_app/Screens/home_page.dart';
import 'package:first_app/Screens/login.dart';
import 'package:first_app/Screens/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=>const LoginScreen(),
      'register': (context)=>const RegisterScreen(),
      'forgotPassword': (context)=>const ForgotPasswordScreen(),
      'HomePage': (context)=>const HomeScreen()
      },
  ));
}

