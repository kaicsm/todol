import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todol/app/core/controllers/theme_controller.dart';

class SettingsController extends GetxController {
  final themeController = Get.find<ThemeController>();

  ThemeMode get currentTheme => themeController.currentTheme.value;

  void changeTheme(ThemeMode themeMode) {
    themeController.changeTheme(themeMode);
  }
}
