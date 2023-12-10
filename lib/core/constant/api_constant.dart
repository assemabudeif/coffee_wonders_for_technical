import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../services/shared_prefrences/cache_helper.dart';

class ApiConstant {
  static const String baseUrl = "https://pos-api.lineerp.live/";

  /// Auth Paths
  static String loginPath =
      '${sl<SharedPreferences>().getString(SharedKey.Language.name) ?? 'en'}/api/auth/technical/login';

  /// Services Paths
  static String getAllRequestsServicePath =
      "${sl<SharedPreferences>().getString(SharedKey.Language.name) ?? 'en'}/api/services";
  static String approveServicePath(String serviceId) =>
      "${sl<SharedPreferences>().getString(SharedKey.Language.name) ?? 'en'}/api/services/approve/$serviceId";
  static String arrivedServicePath(String serviceId) =>
      "${sl<SharedPreferences>().getString(SharedKey.Language.name) ?? 'en'}/api/services/arrived/$serviceId";
  static String startedServicePath(String serviceId) =>
      "${sl<SharedPreferences>().getString(SharedKey.Language.name) ?? 'en'}/api/services/started/$serviceId";
  static String finishedServicePath(String serviceId) =>
      "${sl<SharedPreferences>().getString(SharedKey.Language.name) ?? 'en'}/api/services/finish/$serviceId";

  /// All Parts Path
  static String getAllPartsPath =
      "${sl<SharedPreferences>().getString(SharedKey.Language.name) ?? 'en'}/api/parts";
}
