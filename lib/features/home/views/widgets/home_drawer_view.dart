import 'package:coffee_wonders_for_technical/core/my_app.dart';
import 'package:coffee_wonders_for_technical/core/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/services/shared_prefrences/cache_helper.dart';
import '../../../../main.dart';
import '/core/resources/assets_manager.dart';
import '/core/resources/color_manager.dart';
import '/core/resources/constants_manager.dart';
import '/features/auth/data/repo/auth_repo_impl.dart';
import '/features/auth/view_model/auth_bloc.dart';
import '/features/auth/view_model/auth_event.dart';

class HomeDrawerView extends StatelessWidget {
  const HomeDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.3,
                  backgroundColor: ColorManager.white,
                  child: ClipOval(
                    child: Image.asset(
                      AssetsManager.logo,
                      height: 200.h,
                      width: 200.w,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${AppLocalizations.of(context)!.name}: ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            // color: ColorManager.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: AppConstants.technicalName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            // color: ColorManager.mintGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${AppLocalizations.of(context)!.email}: ",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            // color: ColorManager.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: AppConstants.technicalEmail,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            // color: ColorManager.mintGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              ListTile(
                onTap: () {
                  MyApp.instance.changeAppTheme(context);
                },
                leading: Icon(
                  !AppConstants.isDark ? Icons.dark_mode : Icons.light_mode,
                  // color: ColorManager.primaryColor,
                ),
                title: Text(
                  !AppConstants.isDark
                      ? AppLocalizations.of(context)!.darkMode
                      : AppLocalizations.of(context)!.lightMode,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        // color: ColorManager.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),

              /// change language
              ListTile(
                onTap: () {
                  MyApp.instance.changeAppLanguage(context);

                  // LanguageManger.changeAppLanguage();
                },
                leading: const Icon(
                  Icons.language,
                  // color: ColorManager.primaryColor,
                ),
                title: Text(
                  AppConstants.appLanguage != LanguageType.english.getValue()
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        // color: ColorManager.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  _showDialogForLogout(context);
                },
                leading: const Icon(
                  Icons.logout,
                  // color: ColorManager.primaryColor,
                ),
                title: Text(
                  AppLocalizations.of(context)!.logout,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        // color: ColorManager.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logout(BuildContext context) {
    AuthBloc(AuthRepositoryImpl()).add(AuthLogoutEvent(context: context));
  }

  _showDialogForLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.logout),
        content: Text(AppLocalizations.of(context)!.logoutMessage),
        icon: const Icon(
          Icons.logout,
          color: ColorManager.primaryColor,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        backgroundColor: ColorManager.white,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 10.w,
        actions: [
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: ColorManager.primaryColor,
                ),
              ),
              child: Text(AppLocalizations.of(context)!.cancel)),
          OutlinedButton(
            onPressed: () {
              _logout(context);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: ColorManager.primaryColor,
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.ok,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.error,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
