import 'dart:developer';

import '/core/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/bloc_observer.dart';
import 'core/my_app.dart';
import 'core/services/dio_helper/dio_helper.dart';
import 'core/services/shared_prefrences/cache_helper.dart';

GetIt sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _initialSharedPreference();
  AppConstants.sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(AppConstants.sharedPreferences!);
  await _initialAppConfig();
  // await DBHelper.instance.createDataBase();
  log(sl<SharedPreferences>().get(SharedKey.token.name).toString());
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

Future<void> _initialAppConfig() async {
  // await EasyLocalization.ensureInitialized();
  DioHelper.init();
  Bloc.observer = AppBlocObserver();
}
