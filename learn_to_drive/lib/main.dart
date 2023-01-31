import 'package:flutter/material.dart';

import 'package:first_app/Screens/login.dart';
import 'package:first_app/Screens/register.dart';
import 'package:first_app/Screens/forgot_password.dart';

import 'package:first_app/navigator.dart';
import 'package:first_app/Screens/tutorials.dart';

import 'package:first_app/HomeScreens/home_page.dart';
import 'package:first_app/HomeScreens/traffic_sign.dart';
import 'package:first_app/HomeScreens/reading_materials.dart';
import 'package:first_app/HomeScreens/mock_exam.dart';
import 'package:first_app/HomeScreens/trial_information.dart';
import 'package:first_app/HomeScreens/vision_test.dart';

import 'package:first_app/SettingsScreens/settings.dart';
import 'package:first_app/SettingsScreens/notifications.dart';
import 'package:first_app/SettingsScreens/change_language.dart';
import 'package:first_app/SettingsScreens/change_password.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=>const LoginScreen(),
      'register': (context)=>const RegisterScreen(),
      'forgot_password': (context)=>const ForgotPasswordScreen(),
      'navigator':(context) => const Navigation(),
      'home_page': (context)=>const HomeScreen(),
      'settings':(context) => const SettingsScreen(),
      'tutorials':(context) => const TutorialsScreen(),
      'traffic_signs':(context) => const TrafficSignsPage(),
      'readingMaterials':(context) => const ReadingMaterials(),
      'mockExam':(context) => const MockExam(),
      'trialInformation':(context) => const TrialInformation(),
      'visionTest':(context) => const VisionTest(),
      'notifications':(context) => const Notifications(),
      'changePassword':(context) => const ChangePassword(),
      'change_language':(context) => const ChangeLanguageScreen(),
    },
  ));
}
