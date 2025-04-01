import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final currentTheme = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    updateSystemUiOverlayStyle();
  }

  void changeTheme(ThemeMode themeMode) {
    currentTheme.value = themeMode;
    Get.changeThemeMode(currentTheme.value);
  }

  void updateSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarIconBrightness:
            currentTheme.value == ThemeMode.light
                ? Brightness.dark
                : Brightness.light,
      ),
    );
  }
}
