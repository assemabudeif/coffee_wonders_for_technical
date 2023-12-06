import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../resources/language_manager.dart';
import '../services/shared_prefrences/cache_helper.dart';

class SharedFunction {
  // static void changeLanguage(context) {
  //   LanguageManger.changeAppLanguage();
  //   Phoenix.rebirth(context);
  // }

  static void changeAppMode(context) {
    if (sl<SharedPreferences>().get(SharedKey.isDark.name) == true) {
      sl<SharedPreferences>().setBool(SharedKey.isDark.name, false);
    } else {
      sl<SharedPreferences>().setBool(SharedKey.isDark.name, true);
    }
    Phoenix.rebirth(context);
  }
}
