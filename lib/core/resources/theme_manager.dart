import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getAppLightTheme() {
  return ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.mintGreen,
    scaffoldBackgroundColor: ColorManager.white,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ColorManager.primarySwatchColor,
      backgroundColor: ColorManager.white,
      // accentColor: ColorManager.mintGreen,
      // cardColor: ColorManager.mintGreen,
      brightness: Brightness.light,
      errorColor: ColorManager.error,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.white,
      elevation: AppSize.s0,
      iconTheme: const IconThemeData(
        color: ColorManager.black,
      ),
      centerTitle: true,
      titleTextStyle: getBoldStyle(
        fontSize: FontSizeManager.s20.sp,
        color: ColorManager.mintGreen,
      ),
      actionsIconTheme: const IconThemeData(
        color: ColorManager.black,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: getMediumStyle(
        fontSize: FontSizeManager.s16.sp,
        color: ColorManager.mintGreen,
      ),
      bodyLarge: getBoldStyle(
        fontSize: FontSizeManager.s18.sp,
        color: ColorManager.primaryColor,
      ),
      bodySmall: getMediumStyle(
        fontSize: FontSizeManager.s14.sp,
        color: ColorManager.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5.w,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s10.w,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.green,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s10.w,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.grey),
        borderRadius: BorderRadius.circular(
          AppSize.s10.w,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.error),
        borderRadius: BorderRadius.circular(
          AppSize.s10.w,
        ),
      ),
      prefixIconColor: ColorManager.mintGreen,
      suffixIconColor: ColorManager.mintGreen,
      hintStyle: getMediumStyle(
        fontSize: FontSizeManager.s16.sp,
        color: ColorManager.primaryColor,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.mintGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s10.w,
        ),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: ColorManager.greyWithOpacity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s10,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      selectedIconTheme: IconThemeData(
        color: ColorManager.mintGreen,
        size: AppSize.s24.w,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(
        color: ColorManager.grey,
        size: AppSize.s22.w,
      ),
    ),
  );
}

ThemeData getAppDarkTheme() {
  return ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    primaryColor: ColorManager.white,
    colorScheme: const ColorScheme.dark(),
    // scaffoldBackgroundColor: ColorManager.black,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorManager.mintGreen,
    ),
    appBarTheme: AppBarTheme(
      // backgroundColor: ColorManager.black,
      elevation: AppSize.s0,
      iconTheme: const IconThemeData(
        color: ColorManager.white,
      ),
      centerTitle: true,
      titleTextStyle: getBoldStyle(
        fontSize: FontSizeManager.s20.sp,
        color: ColorManager.mintGreen,
      ),
      actionsIconTheme: const IconThemeData(
        color: ColorManager.white,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.black,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: getMediumStyle(
        fontSize: FontSizeManager.s16.sp,
        color: ColorManager.mintGreen,
      ),
      bodyLarge: getBoldStyle(
        fontSize: FontSizeManager.s20.sp,
        color: ColorManager.white,
      ),
      bodySmall: getMediumStyle(
        fontSize: FontSizeManager.s16.sp,
        color: ColorManager.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.green,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s4,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorManager.green),
        borderRadius: BorderRadius.circular(
          AppSize.s4,
        ),
      ),
      prefixIconColor: ColorManager.mintGreen,
      suffixIconColor: ColorManager.mintGreen,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.green,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s4,
        ),
      ),
      hintStyle: getMediumStyle(
        fontSize: FontSizeManager.s16.sp,
        color: ColorManager.white,
      ),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: ColorManager.greyWithOpacity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s10,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.black,
      selectedIconTheme: IconThemeData(
        color: ColorManager.mintGreen,
        size: AppSize.s26.w,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(
        color: ColorManager.grey,
        size: AppSize.s26.w,
      ),
    ),
  );
}
