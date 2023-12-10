import 'package:get/get.dart';

import '/core/resources/constants_manager.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/shared_prefrences/cache_helper.dart';

enum LanguageType {
  english,
  arabic,
}

extension LanguageTypeExcetention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.arabic:
        return LanguageManger.arabic;
      case LanguageType.english:
        return LanguageManger.english;
    }
  }
}

class LanguageManger {
  static const String arabic = "ar";
  static const String english = "en";
  static const Locale arabicLocal = Locale("ar", "SA");
  static const Locale englishLocal = Locale("en", "US");

  static String getAppLanguage() {
    String? language =
        sl<SharedPreferences>().getString(SharedKey.Language.name);
    AppConstants.appLanguage = language ?? '';
    if (language != null && language.isNotEmpty) {
      return language;
    }
    return Get.deviceLocale?.languageCode ?? LanguageType.english.getValue();
  }

  static Future<void> changeAppLanguage() async {
    String currentLanguage = getAppLanguage();
    if (currentLanguage == LanguageType.arabic.getValue()) {
      sl<SharedPreferences>()
          .setString(SharedKey.Language.name, LanguageType.english.getValue());

      AppConstants.appLanguage = LanguageType.english.getValue();
      Get.updateLocale(englishLocal);
    } else {
      sl<SharedPreferences>()
          .setString(SharedKey.Language.name, LanguageType.arabic.getValue());
      AppConstants.appLanguage = LanguageType.arabic.getValue();
      Get.updateLocale(arabicLocal);
    }
    // Phoenix.rebirth(Get.context!);
  }

  static Locale getLocal() {
    String currentLanguage = getAppLanguage();
    if (currentLanguage == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }
}
