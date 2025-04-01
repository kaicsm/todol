import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todol/app/modules/navigator/controllers/navigator_controller.dart';

class NavigatorView extends StatelessWidget {
  NavigatorView({super.key});

  final controller = Get.find<NavigatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children:
              controller.pages.map((page) {
                return KeyedSubtree(key: ValueKey(page.name), child: page.page);
              }).toList(),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Obx(
      () => NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: (value) => controller.changePage(value),
        destinations:
            controller.pages.map((page) {
              return NavigationDestination(
                icon: Icon(page.icon),
                label: page.name,
              );
            }).toList(),
      ),
    );
  }
}
