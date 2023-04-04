import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeController extends GetxController {
  var isDarkModeOn = true.obs;

  void toggleDarkMode(bool value) {
    isDarkModeOn.value = value;
    Get.changeThemeMode(isDarkModeOn.value ? ThemeMode.dark : ThemeMode.light);
  }
}
