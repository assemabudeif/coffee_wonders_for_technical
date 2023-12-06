import 'package:coffee_wonders_for_technical/core/resources/constants_manager.dart';
import 'package:coffee_wonders_for_technical/features/home/views/finished_service_view.dart';

import '/features/auth/view/login_view.dart';
import '/features/home/views/home_view.dart';
import '/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";

  static const String finishServiceRoute = "finishServiceRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.finishServiceRoute:
        return MaterialPageRoute(
          builder: (_) =>
              FinishedServiceView(serviceId: settings.arguments as String),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
              AppConstants.appLanguage == "en" ? "Not Found" : "غير موجود"),
        ),
        body: Center(
          child: Text(
              AppConstants.appLanguage == "en" ? "Not Found" : "غير موجود"),
        ),
      ),
    );
  }
}
