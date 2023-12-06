import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../services/shared_prefrences/cache_helper.dart';

class AppConstants {
  static const int splashTime = 3;

  static String appLanguage = '';

  static String token = "";
  static String technicalName = "";
  static String technicalEmail = "";

  static SharedPreferences? sharedPreferences;

  static bool isDark = false;
}
