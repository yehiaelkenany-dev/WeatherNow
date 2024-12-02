import 'package:flutter/material.dart';
import 'package:weather_now/presentation/forget_password/forget_password_screen.dart';
import 'package:weather_now/presentation/login/login_screen.dart';
import 'package:weather_now/presentation/main/main_screen.dart';
import 'package:weather_now/presentation/onboarding/view/onboarding_screen.dart';
import 'package:weather_now/presentation/register/register_screen.dart';
import 'package:weather_now/presentation/resources/strings_manager.dart';
import 'package:weather_now/presentation/splash/splash_screen.dart';
import 'package:weather_now/presentation/weather_details/weather_details_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String weatherDetailsRoute = "/weatherDetails"; // store details
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.weatherDetailsRoute:
        return MaterialPageRoute(builder: (_) => const WeatherDetailsScreen());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
