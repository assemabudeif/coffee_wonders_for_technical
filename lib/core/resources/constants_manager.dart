import 'package:shared_preferences/shared_preferences.dart';


class AppConstants {
  static const int splashTime = 3;

  static String appLanguage = '';

  static String token = "";
  static String technicalName = "";
  static String technicalEmail = "";

  static SharedPreferences? sharedPreferences;

  static bool isDark = false;
}
