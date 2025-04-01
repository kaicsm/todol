import 'package:get/get.dart';
import 'package:todol/app/modules/home/bindings/home_binding.dart';
import 'package:todol/app/modules/navigator/controllers/navigator_controller.dart';
import 'package:todol/app/modules/settings/bindings/settings_binding.dart';

class NavigatorBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
    HomeBinding().dependencies();
    SettingsBinding().dependencies();
  }
}