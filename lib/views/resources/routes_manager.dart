import 'package:flutter/material.dart';
import 'package:tut_project/app/di.dart';
import 'package:tut_project/views/forgot_password/forgot_password.dart';
import 'package:tut_project/views/home/home.dart';
import 'package:tut_project/views/login/login.dart';
import 'package:tut_project/views/onBoarding/onboarding.dart';
import 'package:tut_project/views/register/register.dart';
import 'package:tut_project/views/resources/strings_manager.dart';
import 'package:tut_project/views/splash/splash.dart';
import 'package:tut_project/views/store_details/store_details.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingPage());
      case Routes.loginRoute:
        //initLoginModule();
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordPage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
            builder: (context) => const StoreDetailsPage());
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(StringsManager.noRouteFound)),
        body: const Center(
          child: Text(StringsManager.noRouteFound),
        ),
      ),
    );
  }
}
