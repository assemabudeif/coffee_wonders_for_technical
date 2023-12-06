import 'dart:async';
import 'dart:developer';

import '../../../core/resources/routes_manager.dart';
import '/core/resources/constants_manager.dart';
import '/core/services/shared_prefrences/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    initialiseAppConstants();
    log('Language: ${AppConstants.appLanguage}');

    Timer(
      const Duration(seconds: 3),
      () => _nextPage(),
    );
    super.initState();
  }

  _nextPage() {
    if (AppConstants.token.isEmpty) {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.white,
      body: SizedBox(
        child: Center(
          child: Image(
            width: AppSize.s250.w,
            image: AssetImage(
              AppConstants.isDark
                  ? AssetsManager.logoWhite
                  : AssetsManager.logo,
            ),
          ),
        ),
      ),
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
