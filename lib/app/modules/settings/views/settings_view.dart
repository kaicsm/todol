import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todol/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr)),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'theme'.tr,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Obx(
                    () => DropdownButton(
                      value: controller.currentTheme,
                      items:
                          ThemeMode.values
                              .map(
                                (mode) => DropdownMenuItem(
                                  value: mode,
                                  child: Text(getThemeModeName(mode)),
                                ),
                              )
                              .toList(),
                      onChanged:
                          (ThemeMode? newValue) => {
                            if (newValue != null)
                              controller.changeTheme(newValue),
                          },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getThemeModeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'system'.tr;
      case ThemeMode.light:
        return 'light'.tr;
      case ThemeMode.dark:
        return 'dark'.tr;
    }
  }
}
