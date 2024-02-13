import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyleState extends GetxController {
  RxBool isDarkMode = false.obs;
  void toggleTheme() async {
    isDarkMode.toggle();

    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
