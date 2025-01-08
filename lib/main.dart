import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/routes/app_routes.dart';
import 'core/translations/translations.dart';
import 'features/settings/controllers/settings_controller.dart';

void main() async {
  await GetStorage.init();
  Get.put(SettingsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.find<SettingsController>();

    return Obx(() {
      final isArabic = settingsController.currentLanguage.value == 'ar';

      return GetMaterialApp(
        title: 'Nazef',
        translations: Messages(),
        locale: isArabic ? const Locale('ar') : const Locale('en'),
        fallbackLocale: const Locale('en'),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0071BC),
          ),
          textTheme: isArabic
              ? GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
              : GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
        getPages: AppRoutes.routes,
        initialRoute: '/',
      );
    });
  }
}
