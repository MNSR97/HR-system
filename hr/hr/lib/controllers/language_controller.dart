import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static const String _languageKey = 'languageCode';

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  Future<void> changeLanguage(String locale) async {
    Get.updateLocale(Locale(locale));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale);
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? 'en';
    Get.updateLocale(Locale(languageCode));
  }
}
