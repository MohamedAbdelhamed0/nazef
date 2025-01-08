import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final box = GetStorage();
  final RxString currentLanguage = 'en'.obs;

  static const String LANGUAGE_KEY = 'language';

  @override
  void onInit() {
    super.onInit();
    // Load saved language
    String? savedLang = box.read(LANGUAGE_KEY);
    if (savedLang != null) {
      currentLanguage.value = savedLang;
      Get.updateLocale(Locale(savedLang));
    }
  }

  void saveLanguage(String? langCode) {
    if (langCode != null) {
      currentLanguage.value = langCode;
      box.write(LANGUAGE_KEY, langCode);
      Get.updateLocale(Locale(langCode));
    }
  }
}
