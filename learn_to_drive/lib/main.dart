import 'package:first_app/Screens/settings.dart';
import 'package:first_app/Screens/traffic_sign.dart';
import 'package:first_app/Screens/tutorials.dart';
import 'package:first_app/navigator.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Screens/forgot_password.dart';
import 'package:first_app/Screens/home_page.dart';
import 'package:first_app/Screens/login.dart';
import 'package:first_app/Screens/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'navigator',
    routes: {
      'login': (context)=>const LoginScreen(),
      'register': (context)=>const RegisterScreen(),
      'forgot_password': (context)=>const ForgotPasswordScreen(),
      'home_page': (context)=>const HomeScreen(),
      'navigator':(context) => const Navigation(),
      'settings':(context) => const SettingsScreen(),
      'tutorials':(context) => const TutorialsScreen(),
      'traffic_signs':(context) => const TrafficSignsPage(),
      },
  ));
}

