import 'dart:developer';

import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'resources/constants_manager.dart';
import 'resources/routes_manager.dart';
import 'resources/theme_manager.dart';
import 'services/shared_prefrences/cache_helper.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  changeAppLanguage(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setState(() {
      if (AppConstants.appLanguage == 'en') {
        AppConstants.appLanguage = 'ar';
        state.myAppLocale = 'ar';
        // Get.updateLocale(const Locale('ar'));
        sl<SharedPreferences>()
            .setString(SharedKey.Language.name, AppConstants.appLanguage);
      } else {
        AppConstants.appLanguage = 'en';
        state.myAppLocale = 'en';
        Get.updateLocale(const Locale('en'));
        sl<SharedPreferences>()
            .setString(SharedKey.Language.name, AppConstants.appLanguage);
      }
    });
    Phoenix.rebirth(context);
  }

  changeAppTheme(BuildContext context) {
    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
    AppConstants.isDark = !AppConstants.isDark;
    sl<SharedPreferences>().setBool(SharedKey.isDark.name, AppConstants.isDark);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String myAppLocale = AppConstants.appLanguage;
  @override
  void initState() {
    initialiseAppConstants();

    log('Language: ${AppConstants.appLanguage}');
    log('Token: ${AppConstants.token}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return GetMaterialApp(
          locale: Locale(AppConstants.appLanguage),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: getAppLightTheme(),
          darkTheme: getAppDarkTheme(),
          themeMode:
              sl<SharedPreferences>().getBool(SharedKey.isDark.name) != true
                  ? ThemeMode.light
                  : ThemeMode.dark,
          initialRoute: Routes.splashRoute,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
  }

  void initialiseAppConstants() {
    AppConstants.appLanguage =
        sl<SharedPreferences>().getString(SharedKey.Language.name) ?? 'en';
    AppConstants.token =
        sl<SharedPreferences>().getString(SharedKey.token.name) ?? '';
    AppConstants.technicalName =
        sl<SharedPreferences>().getString(SharedKey.technicalName.name) ?? '';
    AppConstants.technicalEmail =
        sl<SharedPreferences>().getString(SharedKey.technicalEmail.name) ?? '';
    AppConstants.isDark =
        sl<SharedPreferences>().getBool(SharedKey.isDark.name) ?? false;
  }
}
