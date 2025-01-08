import 'package:get/get.dart';

import '../../features/home/views/commercial_view.dart';
import '../../features/home/views/home_view.dart';
import '../../features/home/views/residential_view.dart';
import '../../features/home/views/specialized_view.dart';
import '../../features/settings/bindings/settings_binding.dart';
import '../../features/settings/views/settings_view.dart';
import '../../features/splash/views/splash_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const SplashView(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeView(),
    ),
    GetPage(
      name: '/settings',
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: '/residential',
      page: () => ResidentialView(),
    ),
    GetPage(
      name: '/commercial',
      page: () => CommercialView(),
    ),
    GetPage(
      name: '/specialized',
      page: () => SpecializedView(),
    ),
  ];
}
