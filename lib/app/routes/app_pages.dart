import 'package:get/get_navigation/get_navigation.dart';
import 'package:todol/app/modules/home/views/home_view.dart';
import 'package:todol/app/modules/home/bindings/home_binding.dart';
import 'package:todol/app/modules/navigator/bindings/navigator_binding.dart';
import 'package:todol/app/modules/navigator/views/navigator_view.dart';
import 'package:todol/app/modules/settings/bindings/settings_binding.dart';
import 'package:todol/app/modules/settings/views/settings_view.dart';
import 'package:todol/app/routes/app_routes.dart';

class AppPages {
  static const initial = AppRoutes.navigator;

  static final routes = [
    GetPage(
      name: AppRoutes.navigator,
      page: () => NavigatorView(),
      binding: NavigatorBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsView(),
      binding: SettingsBinding()
    )
  ];
}