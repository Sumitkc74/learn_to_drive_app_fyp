import 'package:first_app/Screens/navigator.dart';
import 'package:first_app/Screens/splashscreen.dart';
import 'package:first_app/Services/locale_string.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    translations: LocaleString(),
    locale: const Locale('en','US'),
    home: const SplashScreen()
  ));
}
