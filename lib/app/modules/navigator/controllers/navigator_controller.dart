import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todol/app/modules/home/views/home_view.dart';
import 'package:todol/app/modules/settings/views/settings_view.dart';

class NavigatorController extends GetxController {
  final List<NavigatorPage> pages = [
    NavigatorPage(name: 'home'.tr, icon: Icons.home, page: HomeView()),
    NavigatorPage(
      name: 'settings'.tr,
      icon: Icons.settings,
      page: SettingsView(),
    ),
  ];
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}

class NavigatorPage {
  final String name;
  final IconData icon;
  final Widget page;

  NavigatorPage({required this.name, required this.icon, required this.page});
}
