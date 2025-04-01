import 'package:flutter/material.dart';
import 'package:todol/app/core/controllers/theme_controller.dart';
import 'package:todol/app/routes/app_pages.dart';
import 'package:todol/app/utils/app_theme.dart';
import 'package:todol/app/utils/app_translations.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        title: 'Todol',
        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
        themeMode: themeController.currentTheme.value,
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(),
        locale: const Locale('pt', 'BR'),
        fallbackLocale: const Locale('en', 'US'),
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    );
  }
}
